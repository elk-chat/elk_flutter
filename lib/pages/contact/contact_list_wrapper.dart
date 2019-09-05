import 'package:elk_chat/widgets/c_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'add_contact.dart';
import 'contact_list.dart';

class ContactPage extends StatefulWidget {
  final title;

  ContactPage({Key key, @required this.title}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xfffafafa),
      navigationBar: CupertinoNavigationBar(
        heroTag: 'ContactList',
        transitionBetweenRoutes: false,
        middle: widget.title,
        // centerTitle: true,
        trailing: CupertinoIconButton(
          icon: Icon(
            Icons.add,
          ),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => NewContactPage(
                  title: '添加联系人',
                )
              )
            );
          },
        )
      ),
      child: ContactList(),
    );
  }
}
