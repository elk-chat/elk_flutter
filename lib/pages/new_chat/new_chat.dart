import 'package:elk_chat/protocol/api_util/api_util.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/pages/chat_page/chat_page.dart';
import 'package:elk_chat/widgets/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/pages/contact_list/list.dart';
import 'new_group_select_users.dart';

// 添加新消息
class NewChatPage extends StatefulWidget {
  final String title;

  NewChatPage({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  _NewChatPageState createState() => _NewChatPageState();
}

class _NewChatPageState extends State<NewChatPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: 'NewChat',
        transitionBetweenRoutes: false,
        // heroTag: 'NewChat',
        middle: Text(widget.title),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.add,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      child: ContactList(
        onTap: (contact) {
          var chat = Chat();
          chat.chatType = ChatType.OneToOne;
          // Navigator.popUntil(context, ModalRoute.withName('/'));
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) => ChatWindowPage(
                title: Text(contact.userName),
                chat: chat,
                user: contact,
                avatarFileID: contact.avatarFileID,
              )
            )
          );
        },
        beforeWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListItem(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) =>
                      NewGroupChatSelectUsersPage(
                        title: '群聊',
                      )
                    )
                  );
              },
              leading: Icon(Icons.group),
              title: Text('发起群聊')
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Text('联系人',
                  style: TextStyle(fontSize: 13, color: Colors.black54)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              color: const Color(0xffeeeeee)
            )
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
