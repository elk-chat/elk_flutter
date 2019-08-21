import 'dart:async';
import 'dart:io';

import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/flushbar.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elk_chat/repositorys/repositorys.dart';
import 'package:intl/intl.dart';
import 'msg_bubble.dart';
import 'queue_msg.dart';
import 'queue_msg_bubble.dart';

// 聊天窗口
class ChatWindowScreen extends StatefulWidget {
  final title;
  final Chat chat;
  final User user;
  final ChatRepository chatRepository;
  final AuthAuthenticated authState;

  ChatWindowScreen(
      {Key key,
      @required this.title,
      @required this.chat,
      this.user,
      @required this.chatRepository,
      @required this.authState})
      : super(key: key);

  @override
  _ChatWindowScreenState createState() => _ChatWindowScreenState();
}

class _ChatWindowScreenState extends State<ChatWindowScreen> {
  final _scrollController = ScrollController();
  final _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final int PAGE_SIZE = 12;
  final DateFormat dateFormat = DateFormat('MM/dd HH:mm');

  File imageFile;
  int pageIndex = 0;
  bool loading = true;
  bool hasReachedMax = false;
  Int64 pageSize;
  Int64 allCount;
  // 消息列表，优化：滚动太多的时候，从内存中移除
  List<StateUpdate> msgs = [];
  // 新来的消息列表
  List<StateUpdate> coming_msgs = [];

  // 发送中或者待发送列表
  List<QueueMsg> queue_msgs = [];

  bool showSticker = false;
  bool showAttachment = false;

  // 判断有没有初始化聊天
  bool hasInit = false;

  Timer typingTimer;

  Function unSupscription;
  Function readSubscription;

  ChatInitiateReq _ChatInitiateReq = ChatInitiateReq();
  Chat _chat;
  ChatBloc _chatBloc;

  ChatGetStateReadResp _stateRead = ChatGetStateReadResp();

  @override
  void initState() {
    super.initState();

    _chatBloc = BlocProvider.of<ChatBloc>(context);

    _chat = widget.chat;
    // 判断有没有初始化聊天（从详情点击过去的）
    hasInit = _chat.chatID.toInt() != 0;

    if (hasInit) {
      init();
    } else {
      createChat();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();

    if (unSupscription != null) unSupscription();
    if (readSubscription != null) readSubscription();
    super.dispose();
  }

  void createChat() {
    _ChatInitiateReq.peerID = widget.user.userID;
    initPeerChat(_ChatInitiateReq, (data) {
      if (!mounted) return;
      if (data.hasError) {
        var error = 'initPeerChat error: ${data.res}';
        showFlushBar(error, context);
        print(error);
      } else {
        _chat = data.res.chat;
        _chatBloc.dispatch(AddChat(chat: data.res.chat));
        // 创建聊天
        init();
      }
    });
  }

  void init() {
    _focusNode.addListener(onFocusChange);
    _scrollController.addListener(_scrollListener);

    var _ChatGetStateReadReq = ChatGetStateReadReq();
    _ChatGetStateReadReq.chatID = _chat.chatID;
    // 获取读到哪条，需要监听 stateRead 变化
    getStateRead(_ChatGetStateReadReq, (data) {
      if (data.hasError) {
        // showFlushBar('获取未读 stateRead 失败: ${data.res}', context);
      } else {
        _stateRead = data.res;
        print('未读 stateRead: ${data.res}');

        readSubscription = $WS.on(CHEvent.READ_MSG(_chat.chatID), (res) {
          _stateRead.stateRead =
              res.updateMessage.updateMessageChatReadMessage.stateRead;
          if (mounted) {
            setState(() {
              _stateRead = _stateRead;
            });
          }
        });
        getMsgHistory(null, null);
      }
    });

    unSupscription = $WS.on(CHEvent.ALL_MSG(_chat.chatID), (res) {
      if (res.messageType == ChatMessageType.ReadState) return;
      // 有新消息
      if (mounted) {
        // 去重
        bool duplicates = false;
        for (var i in msgs) {
          if (i.state == res.state) {
            duplicates = true;
            print('重复消息 $res');
            break;
          }
        }
        // 如果重复，去掉
        if (duplicates) return;
        // 是否可以取后面的进行优化？
        List<StateUpdate> msgList = [res]..addAll(msgs.toList());
        // 根据 state 排序，这里的 state 有可能是重复的
        msgList.sort((a, b) => b.state.compareTo(a.state));
        setState(() {
          msgs = msgList;
        });

        _scrollController.animateTo(0.0,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    });
  }

  void onFocusChange() {
    if (_focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        showAttachment = false;
        showSticker = false;
      });
    }
  }

  // 列表是倒过来的，所以滚动到顶部，这里是滚动到底部
  void _scrollListener() {
    if (hasReachedMax || loading) return;
    if ((_scrollController.offset + 50) >=
        _scrollController.position.maxScrollExtent) {
      // print("reach the top");
      var firstMsg = msgs[msgs.length - 1];
      print('first msg $firstMsg');
      getMsgHistory(
        firstMsg == null ? null : firstMsg.state,
        null,
      );
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      // print("reach the bottom");
    }
  }

  Future getMsgHistory(Int64 stateBefore, Int64 stateAfter) async {
    setState(() {
      loading = true;
    });
    try {
      print('获取聊天记录 $pageIndex');
      var res = await widget.chatRepository.getMsgHistory(
        _chat.chatID,
        [1, 2], // messageTypes
        null, //pageIndex
        PAGE_SIZE, // pageSize

        stateBefore, //stateBefore,
        stateAfter, // stateAfter,
      );
      if (!mounted) return;

      if (res.stateUpdates.length < PAGE_SIZE) {
        hasReachedMax = true;
      }
      if (mounted) {
        setState(() {
          loading = false;
          pageIndex = pageIndex + 1;
          pageSize = res.paging.pageSize;
          msgs = (msgs.toList())..addAll(res.stateUpdates);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
      print('getMsgHistory error $e');
    }
  }

  Future getImageFromGallery() async {
    try {
      imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      var bytes = await imageFile.readAsBytes();
      var _UtilityUploadReq = UtilityUploadReq();
      _UtilityUploadReq.chatID = _chat.chatID;
      _UtilityUploadReq.data = bytes;
      _UtilityUploadReq.fileName =
          DateTime.now().millisecondsSinceEpoch.toString();
      uploadFile(_UtilityUploadReq, (data) {
        if (data.hasError) {
          showFlushBar('UtilityUploadReq error ${data.res}', context);
          print('${data.res}');
        } else {
          print(data.res.file);
        }
      });
      print('imageFile $imageFile');

      print('file name ${imageFile.path.split('/').last}');

      readFileFromPath(imageFile.path);
    } catch (e) {
      print('image picker error $e');
    }
  }

  readFileFromPath(path) async {
    try {
      var file = await File(path);
      var bytes = await file.readAsBytes();
      print('readFileFromPath bytes length ${bytes.length}');
    } catch (e) {
      print('readFileFromPath error $e');
    }
  }

  Future getImageFromCamera() async {
    try {
      imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
      print('imageFile $imageFile');
    } catch (e) {
      print('image picker error $e');
    }
  }

  onTyping() {
    if (typingTimer == null) {
      typingTimer = Timer(Duration(seconds: 1), () {
        print('停止输入');
        typingTimer = null;
      });
      widget.chatRepository.sendTyping(_chat.chatID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        centerTitle: true,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(
          //     MaterialCommunityIcons.getIconData('dots-horizontal'),
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             fullscreenDialog: true,
          //             builder: (BuildContext context) =>
          //                 NewChatScreen(title: '新聊天')));
          //   },
          // ),
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              buildMessageList(),
              buildInput(),
              // (showSticker ? buildSticker() : Container()),
              (showAttachment ? buildAttachment() : Container()),
            ],
          )
        ],
      )),
    );
  }

  Widget buildMessageList() {
    int msgsLength = msgs.length + queue_msgs.length;
    int allMsgsLength = msgsLength + (loading ? 1 : 0);
    return Flexible(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        itemCount: allMsgsLength,
        reverse: true,
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (loading && index == msgsLength) {
            return CupertinoActivityIndicator(
              radius: 10,
            );
          }
          // 如果是已经加载的消息
          if (index < queue_msgs.length) {
            var queueMsg = queue_msgs[index];
            return QueueMsgBubble(
                chatRepository: widget.chatRepository,
                queueMsg: queueMsg,
                dateFormat: dateFormat,
                remove: () {
                  setState(() {
                    queue_msgs = queue_msgs
                        .where((i) => i.actionTime != queueMsg.actionTime)
                        .toList();
                  });
                });
          }

          var stateUpdate = msgs[index - queue_msgs.length];
          return MsgBubble(
            key: ValueKey(stateUpdate.messageID),
            dateFormat: dateFormat,
            getStateRead: () => _stateRead,
            setOwnStateRead: (stateRead) {
              print('stateRead $stateRead');

              _stateRead.ownStateRead = stateRead;
              print('stateReadAll $_stateRead');
            },
            userName: widget.authState.account.user.userName,
            isSelf:
                stateUpdate.senderID == widget.authState.account.user.userID,
            stateUpdate: stateUpdate,
          );
        },
      ),
    );
  }

  Widget buildInput() {
    return GestureDetector(
        onTap: focusInput,
        child: Container(
          child: Row(
            children: <Widget>[
              // Button send image
              Material(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  child: IconButton(
                    icon: Icon(MaterialCommunityIcons.getIconData(
                        showAttachment ? 'chevron-down-circle' : 'attachment')),
                    onPressed: () {
                      _focusNode.unfocus();
                      setState(() {
                        showSticker = false;
                        showAttachment = !showAttachment;
                      });
                    },
                    color: Colors.black45,
                  ),
                ),
                color: Colors.white10,
              ),

              // Edit text
              Flexible(
                child: ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: 100.0,
                    ),
                    child: CupertinoTextField(
                      padding: const EdgeInsets.all(0.0),
                      // style: TextStyle(color: Colors.black87),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      onChanged: (value) {
                        // 正在输入
                        onTyping();
                      },
                      placeholder: '输入',
                      decoration: BoxDecoration(color: Colors.transparent),
                      scrollPhysics: const BouncingScrollPhysics(),
                    )),
              ),
              // Button send message
              Material(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  child: IconButton(
                    icon: Icon(MaterialCommunityIcons.getIconData('send')),
                    onPressed: () {
                      onSendMessage(
                          _textEditingController.text, ChatContentType.Text);
                    },
                    color: Colors.black45,
                  ),
                ),
                color: Colors.white10,
              ),
            ],
          ),
          width: double.infinity,
          // height: 50.0,
          decoration: BoxDecoration(
              // color: Color(0xffeeeeee),
              border: Border(
                  top: const BorderSide(color: Colors.black26, width: 0.5))),
        ));
  }

  focusInput() {
    print('focus');
    _focusNode.unfocus();
    FocusScope.of(context).requestFocus(_focusNode);
  }

  // 发送消息直接推送到列表，等返回再移除
  // 文件上传得到路径
  onSendMessage(String msg, int contentType) async {
    var message = msg.trim();
    if (message.isEmpty) {
      focusInput();
      return;
    }

    setState(() {
      QueueMsg _queueMsgItem = QueueMsg.fromMap({
        'status': QueueMsgStatus.init,
        'chatID': _chat.chatID,
        'messageType': ChatMessageType.SendMessage,
        'contentType': ChatContentType.Text,
        'message': message,
        'actionTime': DateTime.now().millisecondsSinceEpoch
      });
      setState(() {
        queue_msgs = [_queueMsgItem]..addAll(queue_msgs);
      });
      _textEditingController.clear();
    });
    // try {
    //   var res =
    //       await widget.chatRepository.sendMsg(_chat.chatID, contentType, text);
    //   print('send message response: $res');
    //   _textEditingController.clear();
    // } catch (e) {
    //   print('send message error $e');
    // }
  }

  Widget buildAttachment() {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              iconSize: 36.0,
              color: Colors.blueAccent,
              onPressed: getImageFromCamera,
              icon: Icon(MaterialCommunityIcons.getIconData('camera')),
            ),
            IconButton(
              iconSize: 35.0,
              color: Colors.purpleAccent,
              onPressed: getImageFromGallery,
              icon: Icon(MaterialCommunityIcons.getIconData('image')),
            ),
            // IconButton(
            //   iconSize: 33.0,
            //   color: Colors.lightBlue,
            //   onPressed: getImageFromGallery,
            //   icon: Icon(MaterialCommunityIcons.getIconData('file')),
            // ),
          ],
        )
      ],
    ));
  }
}
