import 'dart:async';
import 'dart:io';

import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elk_chat/repositorys/repositorys.dart';
import 'msg_bubble.dart';

// 聊天窗口
class ChatWindowScreen extends StatefulWidget {
  final title;
  final Chat chat;
  final User contact;
  final ChatRepository chatRepository;
  final AuthAuthenticated authState;

  ChatWindowScreen(
      {Key key,
      @required this.title,
      this.chat,
      this.contact,
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

  File imageFile;
  int pageIndex = 0;
  bool loading = false;
  bool hasReachedMax = false;
  Int64 pageSize;
  Int64 allCount;
  List<StateUpdate> msgs = [];

  bool showSticker = false;
  bool showAttachment = false;

  Timer typingTimer;

  Function unSupscription;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(onFocusChange);
    _scrollController.addListener(_scrollListener);
    getMsgHistory();

    unSupscription = $WS.on(CHEvent.ALL_MSG(widget.chat.chatID), (res) {
      if (res.messageType == ChatMessageType.ReadState) return;
      setState(() {
        msgs = [res]..addAll(List.from(msgs));
      });

      _scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });

    var _ChatGetStateReadReq = ChatGetStateReadReq();
    _ChatGetStateReadReq.chatID = widget.chat.chatID;
    getStateRead(_ChatGetStateReadReq, (data) {
      print('stateRead $data');
    });
  }

  @override
  void dispose() {
    unSupscription();
    _scrollController.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
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
    if ((_scrollController.offset + 50) >=
        _scrollController.position.maxScrollExtent) {
      // print("reach the top");
      getMsgHistory();
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      // print("reach the bottom");
    }
  }

  Future getMsgHistory() async {
    if (hasReachedMax || loading) return;
    setState(() {
      loading = true;
    });
    try {
      print('获取聊天记录 $pageIndex');
      var res = await widget.chatRepository
          .getMsgHistory(pageIndex, 20, widget.chat.chatID, [1, 2]);
      if (!mounted) return;
      if (res.stateUpdates.length < 20) {
        hasReachedMax = true;
      }
      setState(() {
        loading = false;
        pageIndex = pageIndex + 1;
        pageSize = res.paging.pageSize;
        msgs = List.from(msgs)..addAll(res.stateUpdates);
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      print('getMsgHistory error $e');
    }
  }

  Future getImageFromGallery() async {
    try {
      imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      var bytes = await imageFile.readAsBytes();
      var _UtilityUploadReq = UtilityUploadReq();
      _UtilityUploadReq.chatID = widget.chat.chatID;
      _UtilityUploadReq.data = bytes;
      _UtilityUploadReq.fileName = DateTime.now().millisecondsSinceEpoch.toString();
      uploadFile(_UtilityUploadReq, (data) {
        if (data.hasError) {
          print('${data.res}');
        } else {
          print(data.res.file);
        }
      });
      print('imageFile $imageFile');
    } catch (e) {
      print('image picker error $e');
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
      widget.chatRepository.sendTyping(widget.chat.chatID);
    } else {
      typingTimer?.cancel();
      typingTimer = Timer(Duration(milliseconds: 200), () {});
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
      body: Stack(
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
      ),
    );
  }

  Widget buildMessageList() {
    return Flexible(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          if (loading && index == msgs.length) {
            return CupertinoActivityIndicator(
              radius: 10,
            );
          }
          var stateUpdate = msgs[index];

          return MsgBubble(
            key: ValueKey(stateUpdate.messageID),
            userName: widget.authState.account.user.userName,
            isSelf:
                stateUpdate.senderID == widget.authState.account.user.userID,
            stateUpdate: stateUpdate,
          );
        },
        itemCount: msgs.length + (loading ? 1 : 0),
        reverse: true,
        controller: _scrollController,
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

  onSendMessage(String msg, int contentType) async {
    var text = msg.trim();
    if (text.isEmpty) {
      focusInput();
      return;
    }
    try {
      var res = await widget.chatRepository
          .sendMsg(widget.chat.chatID, contentType, text);
      print('res $res');
      _textEditingController.clear();
    } catch (e) {
      print('send message error $e');
    }
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
