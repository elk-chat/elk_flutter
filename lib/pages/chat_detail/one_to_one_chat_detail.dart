import 'package:elk_chat/blocs/chat/chat.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/contact_item.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneToOneChatDetailPage extends StatefulWidget {
  final String title;
  final Int64 avatarFileID;
  final Chat chat;
  final User user;

  OneToOneChatDetailPage(
      {Key key,
      @required this.title,
      @required this.avatarFileID,
      @required this.chat,
      @required this.user})
      : super(key: key);

  @override
  _OneToOneChatDetailState createState() => _OneToOneChatDetailState();
}

class _OneToOneChatDetailState extends State<OneToOneChatDetailPage> {
  ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _chatBloc = BlocProvider.of<ChatBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          ContactWidget(
            user: widget.user,
            avatarSize: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: CupertinoButton(
                    color: Colors.red,
                    onPressed: onConfirmDeleteChat,
                    child:
                        Text('删除该聊天', style: TextStyle(color: Colors.white)))),
          )
        ],
      ),
    );
  }

  onConfirmDeleteChat() {
    showCupertinoModalPopup(
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('将清空聊天记录并删除'),
            // message: Text('描述'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('删除',
                    style: TextStyle(fontSize: 16, color: Colors.red)),
                onPressed: deleteChat,
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        context: context);
  }

  deleteChat() {
    // 服务端暂时没有这个接口，现在只是从客户端删掉
    _chatBloc.dispatch(DeleteChat(chat: widget.chat));
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
