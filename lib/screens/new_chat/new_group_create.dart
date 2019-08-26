// 发起群聊

import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/repositorys/repositorys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'group_info_edit.dart';

class NewGroupChatCreateScreen extends StatefulWidget {
  final String title;
  final ChatRepository chatRepository;
  final List members;

  NewGroupChatCreateScreen({
    Key key,
    @required this.title,
    @required this.members,
    @required this.chatRepository,
  }) : super(key: key);

  _NewGroupChatState createState() => _NewGroupChatState();
}

class _NewGroupChatState extends State<NewGroupChatCreateScreen> {
  TextEditingController _controller = TextEditingController();
  String text = '';
  ChatBloc _chatBloc;
  int avaterSize = 256;
  bool uploading = false;
  Int64 avatarFileID;

  @override
  void initState() {
    super.initState();
    _chatBloc = BlocProvider.of<ChatBloc>(context);
  }

  handleCreateChat() async {
    try {
      var res = await widget.chatRepository.create(text, avatarFileID);
      // res.chat.title = widget.title;
      // res.chat.avatarFileID = widget.avatarFileID;
      print('res.chat ${res.chat}');
      if (avatarFileID != null) {
        res.chat.avatarFileID = avatarFileID;
      }
      res.chat.creatorID = $CH.user.userID;
      _chatBloc.dispatch(AddChat(chat: res.chat));
      widget.chatRepository.addMembers(widget.members, res.chat.chatID);
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } catch (e) {
      print('创建群聊失败：$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title}'),
          centerTitle: true,
          actions: <Widget>[
            CupertinoButton(
              child: Text('创建', style: const TextStyle(fontSize: 15.0)),
              onPressed:
                  text.isNotEmpty && !uploading ? handleCreateChat : null,
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GroupInfoEdit(
                  avatarFileID: avatarFileID,
                  controller: _controller,
                  uploading: uploading,
                  // onChangeAvatar: onChangeAvatar,
                  context: context,
                  setText: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                  setUploading: () {
                    if (mounted) {
                      setState(() {
                        uploading = true;
                      });
                    }
                  },
                  setFinish: (_avatarFileID) {
                    if (mounted) {
                      setState(() {
                        avatarFileID = _avatarFileID;
                        uploading = false;
                      });
                    }
                  },
                ),
                Container(
                    width: double.infinity,
                    child: Text('成员 (${widget.members.length})',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    color: const Color(0xffeeeeee)),
                Flexible(
                    child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var contact = widget.members[index];

                    return ContactWidget(
                        avatarSize: 40.0, user: contact, onTap: null);
                  },
                  itemCount: widget.members.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return EDivider(indent: 60);
                  },
                )),
              ],
            )
          ],
        ));
  }
}
