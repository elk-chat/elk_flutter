import 'dart:async';

import 'package:elk_chat/widgets/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/protocol/api_util/api_util.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elk_chat/blocs/contact/contact.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';

import 'chat_page/chat_page.dart';

/// 个人资料
class ProfilePage extends StatefulWidget {
  final String title;
  final User contact;
  final bool isAtContact;

  ProfilePage(
      {Key key,
      @required this.title,
      @required this.contact,
      this.isAtContact = false})
      : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<ProfilePage> {
  bool loading = false;
  ContactBloc _contactBloc;
  Timer timer;
  bool _isAtContact = false;
  ContactAddReq _ContactAddReq = ContactAddReq();

  @override
  void initState() {
    super.initState();
    _contactBloc = BlocProvider.of<ContactBloc>(context);
  }

  onChat() async {
    var chat = Chat();
    chat.chatType = ChatType.OneToOne;
    Navigator.popUntil(context, ModalRoute.withName('/'));
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (BuildContext context) => ChatWindowPage(
                  title: Text(widget.contact.userName),
                  avatarFileID: widget.contact.avatarFileID,
                  chat: chat,
                  user: widget.contact,
                )));
  }

  handleSaveContact() {
    setState(() {
      loading = true;
    });
    _ContactAddReq.userID = widget.contact.userID;
    addContact(_ContactAddReq, (result) {
      if (result.hasError) {
        showFlushBar(result.res, context);
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
      } else {
        _contactBloc.dispatch(AddContact(user: widget.contact));
        // $WS.emit(UPDATE_CONTACT_LIST);
        Navigator.popUntil(context, ModalRoute.withName('/'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
          bloc: _contactBloc,
          builder: (context, state) {
            _isAtContact = widget.isAtContact;
            // 判断是否在联系人列表中，如果不在联系人列表中，需要展示添加到通讯录
            if (!_isAtContact && state is ContactLoaded) {
              if (state.contacts.isNotEmpty) {
                for (var v in state.contacts) {
                  if (widget.contact.userID == v.userID) {
                    _isAtContact = true;
                    break;
                  }
                }
              }
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ContactWidget(
                  user: widget.contact,
                  avatarSize: 64,
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10.0),
                  child: CupertinoButton(
                      padding: const EdgeInsets.all(12.0),
                      onPressed: onChat,
                      color: Colors.blue,
                      child: Text('发消息')),
                ),
                _isAtContact
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        child: CupertinoButton(
                            padding: const EdgeInsets.all(12.0),
                            onPressed: loading ? null : handleSaveContact,
                            color: Colors.blue,
                            disabledColor: Colors.blue.shade100,
                            child: Text(loading ? '正在保存...' : '保存到通讯录')),
                      ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
