import 'package:elk_chat/repositorys/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:elk_chat/screens/contact_detail.dart';
import '../../blocs/blocs.dart';
import '../new_contact.dart';
import 'list.dart';

class ContactScreen extends StatefulWidget {
  final title;
  final ContactRepository contactRepository;
  final AuthAuthenticated authState;

  ContactScreen(
      {Key key,
      @required this.title,
      @required this.contactRepository,
      @required this.authState})
      : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with AutomaticKeepAliveClientMixin<ContactScreen> {
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
                      builder: (BuildContext context) =>
                          NewContactScreen(title: '新联系人')));
            },
          ),
        ],
      ),
      body: ContactList(onTap: (contact) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProfileScreen(
                    title: contact.userName,
                    contact: contact,
                    isAtContact: true)));
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
