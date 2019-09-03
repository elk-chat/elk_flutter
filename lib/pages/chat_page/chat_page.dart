import 'dart:async';
import 'dart:io';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api_util/api_util.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/utils/chat_msg_config.dart';
import 'package:elk_chat/widgets/c_icon_button.dart';
import 'package:elk_chat/widgets/flushbar.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:image_picker/image_picker.dart';
import 'package:elk_chat/pages/chat_detail/chat_detail.dart';

import 'package:intl/intl.dart';
import 'msg_bubble.dart';
import 'queue_msg.dart';
import 'queue_msg_bubble.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// 聊天窗口
class ChatWindowPage extends StatefulWidget {
  final title;
  final Int64 avatarFileID;
  final Chat chat;
  final User user;

  ChatWindowPage(
      {Key key,
      @required this.title,
      @required this.chat,
      this.user,
      @required this.avatarFileID})
      : super(key: key);

  @override
  _ChatWindowPageState createState() => _ChatWindowPageState();
}

class _ChatWindowPageState extends State<ChatWindowPage> {
  final _scrollController = ScrollController();
  final _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  FocusNode _unFocusNode;
  final DateFormat dateFormat = ChatMsgConfig.msgFormat;

  static int PAGE_SIZE = 12;
  static int INIT_PAGE = 2;
  static int INIT_PAGE_SIZE = PAGE_SIZE * INIT_PAGE;

  Int64 avatarFileID;
  int pageIndex = INIT_PAGE;
  bool loading = true;
  bool hasReachedMax = false;
  Int64 pageSize;
  Int64 allCount;
  // 消息列表，优化：滚动太多的时候，从内存中移除
  List<StateUpdate> chatMsgs = [];

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
    avatarFileID = widget.avatarFileID;
    super.initState();

    _unFocusNode = FocusNode();
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
    _unFocusNode.dispose();

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
    unSupscription = $WS.on(CHEvent.ALL_MSG(_chat.chatID), handleReceiveMsg);
    getStateRead(_ChatGetStateReadReq, (data) {
      if (data.hasError) {
        // showFlushBar('获取未读 stateRead 失败: ${data.res}', context);
      } else {
        _stateRead = data.res;
        readSubscription = $WS.on(CHEvent.READ_MSG(_chat.chatID), handleReadMsg);
        getMsgHistory(null, null);
      }
    });
  }

  handleReadMsg(res) {
    _stateRead.stateRead = res.updateMessage.updateMessageChatReadMessage.stateRead;
    if (mounted) {
      setState(() {
        _stateRead = _stateRead;
      });
    }
  }

  handleReceiveMsg(res) {
    if (res.messageType == ChatMessageType.ReadState) return;
    // 有新消息
    if (mounted) {
      List<StateUpdate> new_msgs = [];
      for (var i in chatMsgs) {
        if (i.state == res.state) {
          print('重复消息，可能是编辑 $res');
        } else {
          new_msgs.add(i);
        }
      }

      // 是否可以取后面的进行优化？
      List<StateUpdate> msgList = [res]..addAll(new_msgs);
      // 根据 messageID 排序，这里的 messageID 有可能是重复的
      msgList.sort((a, b) => b.messageID.compareTo(a.messageID));
      setState(() {
        chatMsgs = msgList;
      });

      _scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
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
      var firstMsg = chatMsgs[chatMsgs.length - 1];
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
      var res = await $CH.chatApi.getMsgHistory(
        _chat.chatID,
        [1, 2, 4], // messageTypes
        null, //pageIndex
        INIT_PAGE_SIZE, // pageSize

        stateBefore, //stateBefore,
        stateAfter, // stateAfter,
      );
      if (!mounted) return;

      if (res.stateUpdates.length < INIT_PAGE_SIZE) {
        hasReachedMax = true;
      }
      if (mounted) {
        setState(() {
          loading = false;
          pageIndex = pageIndex + 1;
          pageSize = res.paging.pageSize;
          chatMsgs = (chatMsgs.toList())..addAll(res.stateUpdates);
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

  // 从图库获取图片
  Future getImageFromGallery() async {
    try {
      File imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 80
      );
      onSendFile(ChatContentType.Image, imageFile);
    } catch (e) {
      var error = "图库选择图片出错 $e";
      showError(error);
    }
  }

  // 从相机获取图片
  Future getImageFromCamera() async {
    try {
      File imageFile = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 80);
      onSendFile(ChatContentType.Image, imageFile);
    } catch (e) {
      var error = "相机拍摄图片出错 $e";
      showError(error);
    }
  }

  void showError(String error) {
    print(error);

    Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14.0
    );
  }

  void onTyping() {
    if (typingTimer == null) {
      typingTimer = Timer(Duration(seconds: 1), () {
        // print('停止输入');
        typingTimer = null;
      });
      $CH.chatApi.sendTyping(_chat.chatID);
    }
  }

  void unFocus([data]) {
    // 触摸收起键盘
    FocusScope.of(context).requestFocus(_unFocusNode);
    if (showAttachment) {
      setState(() {
        showAttachment = false;
      });
    }
  }

  void focusInput() {
    // print('focus');
    _focusNode.unfocus();
    FocusScope.of(context).requestFocus(_focusNode);
  }

  // 发送消息直接推送到列表，等返回再移除
  // 文件上传得到径
  void onSendMessage(String msg, int contentType) async {
    String message = msg.trim();
    if (message.isEmpty) {
      focusInput();
      return;
    }
    Map<String, dynamic> msgData = {
      'status': QueueMsgStatus.init,
      'chatID': _chat.chatID,
      'messageType': ChatMessageType.SendMessage,
      'contentType': ChatContentType.Text,
      'senderName': $CH.user.userName,
      'message': message,
    };
    // addMsgToQueue(msgData);
    sendMSG(msgData);
    _textEditingController.clear();
  }

  // 2. compress file and get file.
  Future<File> compressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      // quality: 100,
      minWidth: 960,
      minHeight: 1280,
    );

    print(file.lengthSync());
    print(result.lengthSync());

    return result;
  }

  // 发送文件：图片/视频/文档等。。
  void onSendFile(int contentType, File file) async {
    if (file == null) return;
    File newFile = await compressAndGetFile(file, file.path);
    file = null;
    // addMsgToQueue(sendMsgData);
    sendFile(newFile.path, contentType, (fileID) {
      Map sendMsgData = {
        'status': QueueMsgStatus.init,
        'chatID': _chat.chatID,
        'messageType': ChatMessageType.SendMessage,
        'contentType': contentType,
        'senderName': $CH.user.userName,
        'message': '',
        'fileID': fileID
        // 'filePath': newFile.path,
      };
      sendMSG(sendMsgData);
    });
  }

  List<int> bytes;
  // 发送文件：图片/视频/文件 etc
  void sendFile(String filePath, int contentType, Function onUpdated) async {
    bytes = await readFileBytesFromPath(filePath);
    UtilityUploadReq utilityUploadReq = UtilityUploadReq();
    utilityUploadReq.chatID = _chat.chatID;
    utilityUploadReq.data = bytes;
    utilityUploadReq.fileName = filePath.split('/').last;
    utilityUploadReq.contentType = contentType;

    switch (contentType) {
      // 处理图片
      case ChatContentType.Image:
        var imageInfo = await getImageInfo(bytes);
        utilityUploadReq.width = imageInfo.width;
        utilityUploadReq.height = imageInfo.height;
        imageInfo.dispose();
        break;
      default:
    }

    // if (contentType == ChatContentType.Image) {
    //   // setState(() {});
    //   // utilityUploadReq.caption = 'caption';
    // }
    uploadFile(utilityUploadReq, (data) async {
      utilityUploadReq.clear();
      if (data.hasError) {
        print('上传文件错误 ${data.res}');
      } else {
        // sendMsg('', data.res.file.fileID);
        if(onUpdated != null) onUpdated(data.res.file.fileID);
        // sendMSG(msgData);
        // 缓存图片
        await DefaultCacheManager().putFile(data.res.file.uRL, bytes);
        bytes = null;
      }
    });
  }
  readFileBytesFromPath(path) async {
    File file = await File(path);
    List<int> bytes = await file.readAsBytes();
    return bytes;
  }
  // 获取图片宽高
  getImageInfo(List<int> fileBytes) async {
    var decodedImage = await decodeImageFromList(fileBytes);
    return decodedImage;
  }

  // void addMsgToQueue(Map msgData) async {
  //   sendMSG(msgData);
  //   // QueueMsg _queueMsgItem = QueueMsg.fromMap(msgData);

  //   // var list = [_queueMsgItem];
  //   // list.addAll(queue_msgs);
  //   // setState(() {
  //   //   queue_msgs = list.toList();
  //   // });
  // }

  void sendMSG(msgData) async {
    var res = await $CH.chatApi.sendMsg(
      _chat.chatID, msgData['contentType'], msgData['message'], msgData['fileID']
    );
    // try {
    //   var res = await $CH.chatApi.sendMsg(
    //     _chat.chatID, msgData['contentType'], msgData['message'], msgData['fileID']
    //   );
    // } catch (e) {
    //   print('消息发送失败 $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // heroTag: 'ChatWindow',
        middle: _chat.chatType == ChatType.Group ? Text(_chat.title) : widget.title,
        trailing: CupertinoIconButton(
          onTap: () {
            if (_chat.chatType == ChatType.OneToOne) {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) =>
                    OneToOneChatDetailPage(
                      title: '聊天详情',
                      avatarFileID: avatarFileID,
                      user: widget.user,
                      chat: widget.chat
                    )
                  )
              );
            } else if (_chat.chatType == ChatType.Group) {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) =>
                    GroupChatDetailPage(
                      title: '聊天信息',
                      updateParentChat: (chat) {
                        _chat = chat;
                        setState(() {});
                      },
                      avatarFileID: _chat.avatarFileID,
                      chat: _chat
                    )
                  )
                );
            }
          },
          icon: Icon(
            Icons.more_horiz
          )
        )
      ),
      child: SafeArea(
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
        )
      ),
    );
  }

  Widget buildMessageList() {
    int msgsLength = chatMsgs.length;
    int allMsgsLength = msgsLength + (loading ? 1 : 0);
    return Flexible(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: unFocus,
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
            // if (index < queue_msgs.length) {
            //   QueueMsg queueMsg = queue_msgs[index];
            //   return QueueMsgBubble(
            //     key: ValueKey(queueMsg.actionTime),
            //     queueMsg: queueMsg,
            //     dateFormat: dateFormat,
            //     remove: () {
            //       setState(() {
            //         queue_msgs = queue_msgs
            //           .where((i) => i.actionTime != queueMsg.actionTime)
            //           .toList();
            //       });
            //     }
            //   );
            // }

            StateUpdate stateUpdate = chatMsgs[index];
            return MsgBubble(
              key: ValueKey(stateUpdate.messageID),
              chat: widget.chat,
              dateFormat: dateFormat,
              getStateRead: () => _stateRead,
              setOwnStateRead: (stateRead) {
                _stateRead.ownStateRead = stateRead;
              },
              userName: $CH.user.userName,
              isSelf: stateUpdate.senderID == $CH.user.userID,
              stateUpdate: stateUpdate,
            );
          },
        )
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
                    showAttachment ? 'chevron-down-circle' : 'attachment')
                  ),
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
                )
              ),
            ),
            // Button send message
            Material(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1.0),
                child: IconButton(
                  icon: Icon(MaterialCommunityIcons.getIconData('send')),
                  onPressed: () {
                    onSendMessage(_textEditingController.text, ChatContentType.Text);
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
            top: const BorderSide(color: Colors.black26, width: 0.5)
          )
        ),
      )
    );
  }

  Widget buildAttachment() {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  iconSize: 36.0,
                  color: Colors.blueAccent,
                  onPressed: getImageFromCamera,
                  icon: Icon(Icons.camera_alt),
                ),
                IconButton(
                  iconSize: 35.0,
                  color: Colors.purpleAccent,
                  onPressed: getImageFromGallery,
                  icon: Icon(Icons.photo),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
