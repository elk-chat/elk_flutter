import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:elk_chat/pages/contact_detail.dart';
import '../new_contact.dart';
import 'list.dart';

class ContactPage extends StatefulWidget {
  final title;

  ContactPage({Key key, @required this.title}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with AutomaticKeepAliveClientMixin<ContactPage> {
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
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) => NewContactPage(
                            title: '新联系人',
                          )));
            },
          ),
        ],
      ),
      body: ContactList(onTap: (contact) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProfilePage(
                    title: contact.userName,
                    contact: contact,
                    isAtContact: true)));
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
