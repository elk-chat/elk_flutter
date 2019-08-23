import 'package:elk_chat/blocs/chat/chat.dart';
import 'package:elk_chat/protocol/api/state.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 查看附件
// 查看群成员
// 群成员邀请/分享群链接
class GroupChatDetailScreen extends StatefulWidget {
  final String title;
  final Int64 avatarFileID;
  final Chat chat;

  GroupChatDetailScreen({
    Key key,
    @required this.title,
    @required this.avatarFileID,
    @required this.chat,
  }) : super(key: key);

  @override
  _GroupChatDetailState createState() => _GroupChatDetailState();
}

class _GroupChatDetailState extends State<GroupChatDetailScreen> {
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
          ListTile(
              leading: Img(
                  fileID: widget.chat.avatarFileID,
                  title: widget.chat.title,
                  width: 48.0,
                  height: 48.0,
                  type: ChatType.Group),
              title: Text(widget.chat.title)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: CupertinoButton(
                    color: Colors.red,
                    onPressed: onConfirmDeleteChat,
                    child:
                        Text('离开群聊', style: TextStyle(color: Colors.white)))),
          )
        ],
      ),
    );
  }

  onConfirmDeleteChat() {
    showCupertinoModalPopup(
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('将清空聊天记录'),
            // message: Text('描述'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('离开',
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
