// 发起群聊

import 'package:elk_chat/pages/contact/contact_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_group_create.dart';

class NewGroupChatSelectUsersPage extends StatefulWidget {
  final String title;

  NewGroupChatSelectUsersPage({
    Key key,
    @required this.title,
  }) : super(key: key);

  _NewGroupChatState createState() => _NewGroupChatState();
}

class _NewGroupChatState extends State<NewGroupChatSelectUsersPage> {
  List selectUsers = [];
  String selectUsersText = '';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('${widget.title}'),
        heroTag: 'NewGroupChatSelectUsersPage',
        transitionBetweenRoutes: false,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text('完成 (${selectUsers.length})',
              // style: const TextStyle(fontSize: 15.0)
          ),
          onPressed: selectUsers.length > 0
            ? () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) =>
                    NewGroupChatCreatePage(
                      title: '群聊',
                      members: selectUsers,
                    )
                  )
                );
              }
            : null,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // selectUsers.length > 0
                //     ? Container(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 12.0, vertical: 10.0),
                //         child: Text('$selectUsersText'))
                //     : SizedBox(),
                Container(
                  width: double.infinity,
                  child: Text('选择联系人',
                      style: TextStyle(fontSize: 13, color: Colors.black54)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  color: const Color(0xffeeeeee)
                ),
                // Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //     child: Row(
                //       children: <Widget>[
                //         Flexible(
                //             fit: FlexFit.loose,
                //             child: TextField(
                //               style: TextStyle(
                //                   color: Colors.black45, fontSize: 14.0),
                //               keyboardType: TextInputType.text,
                //               autofocus: false,
                //               decoration: InputDecoration.collapsed(
                //                 hintText: '搜索',
                //                 hintStyle: TextStyle(color: Colors.grey),
                //               ),
                //             ))
                //       ],
                //     )),
                Flexible(
                  child: ContactList(
                    onChange: (value, user) {
                      var newSelectUsers = selectUsers.toList();

                      if (!value) {
                        bool filter(i) {
                          return i.userID == user.userID;
                        }

                        newSelectUsers.removeWhere(filter);
                      } else {
                        newSelectUsers.add(user);
                      }

                      setState(() {
                        selectUsers = newSelectUsers;
                        selectUsersText = newSelectUsers.map((i) {
                          return i.userName;
                        }).join(', ');
                      });
                    },
                    hasCheckbox: true
                  )
                ),
              ],
            )
          ],
        ));
  }
}
