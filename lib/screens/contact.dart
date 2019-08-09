import 'package:elk_chat/repositorys/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_detail.dart';
import 'new_contact.dart';
import 'package:elk_chat/blocs/contact/contact.dart';
import '../widgets/widgets.dart';
import 'package:elk_chat/init_websocket.dart';

class ContactScreen extends StatefulWidget {
  final title;
  final ContactRepository contactRepository;

  ContactScreen(
      {Key key, @required this.title, @required this.contactRepository})
      : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with AutomaticKeepAliveClientMixin<ContactScreen> {
  final _scrollController = ScrollController();
  ContactBloc _contactBloc;
  Function updateSubscription;

  @override
  void initState() {
    super.initState();
    _contactBloc = BlocProvider.of<ContactBloc>(context);
    _contactBloc.dispatch(FetchContactList());

    updateSubscription = $WS.on(WS_STATUS, (payload) {
      if (payload.type == WSStatus.updating) {
        _contactBloc.dispatch(FetchContactList());
      }
    });
    // $WS.emitUpdating();
  }

  @override
  void dispose() {
    updateSubscription();
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
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ContactWidget(
                    avatarSize: 42.0,
                    contact: state.contacts[index],
                    onTap: () {
                      var contact = state.contacts[index];
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
            );
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
