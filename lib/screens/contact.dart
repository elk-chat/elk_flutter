import 'package:elk_chat/repositorys/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import 'contact_detail.dart';
import 'new_contact.dart';
import 'package:elk_chat/blocs/contact/contact.dart';
import '../widgets/widgets.dart';

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
  ContactBloc _contactBloc;

  @override
  void initState() {
    super.initState();
    _contactBloc = BlocProvider.of<ContactBloc>(context);
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
      body: BlocBuilder<ContactBloc, ContactState>(
        bloc: _contactBloc,
        builder: (context, state) {
          // if (state is ContactError) {
          //   return Center(
          //     child: Text('failed to fetch contacts'),
          //   );
          // }
          if (state is ContactLoaded) {
            if (state.contacts.isEmpty) {
              return Center(
                child: Text('no contacts'),
              );
            }
            return CupertinoScrollbar(
                child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var contact = state.contacts[index];

                return ContactWidget(
                    key: ValueKey(contact.userID),
                    avatarSize: 42.0,
                    contact: contact,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ProfileScreen(
                                  title: contact.userName,
                                  contact: contact,
                                  isAtContact: true)));
                    });
              },
              itemCount: state.contacts.length,
              controller: _scrollController,
              separatorBuilder: (context, index) {
                return Divider(height: 0, indent: 66);
              },
            ));
          }
          return Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
