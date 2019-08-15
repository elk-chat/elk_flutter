import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/repositorys/chat_repository.dart';
import 'package:elk_chat/screens/chat_window/chat_window.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/screens/contact_list/list.dart';
import 'new_group_select_users.dart';

// 添加新消息
class NewChatScreen extends StatefulWidget {
  final String title;
  final ChatRepository chatRepository;
  final AuthAuthenticated authState;

  NewChatScreen(
      {Key key,
      @required this.title,
      @required this.chatRepository,
      @required this.authState})
      : super(key: key);

  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.add,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: ContactList(
        onTap: (contact) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ChatWindowScreen(
                        title: Text(contact.userName),
                        contact: contact,
                        chatRepository: widget.chatRepository,
                        authState: widget.authState,
                      )));
        },
        beforeWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              NewGroupChatSelectUsersScreen(
                                title: '群聊',
                                chatRepository: widget.chatRepository,
                                authState: widget.authState,
                              )));
                },
                leading: Icon(Icons.group),
                title: Text('发起群聊')),
            SizedBox(
              height: 10.0,
            ),
            Container(
                child: Text('联系人',
                    style: TextStyle(fontSize: 13, color: Colors.black54)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                color: const Color(0xffeeeeee))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
