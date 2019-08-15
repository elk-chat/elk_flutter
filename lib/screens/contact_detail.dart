import 'dart:async';

import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/widgets/flushbar.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elk_chat/blocs/contact/contact.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';

/// 个人资料
class ProfileScreen extends StatefulWidget {
  final String title;
  final User contact;
  final bool isAtContact;

  ProfileScreen(
      {Key key,
      @required this.title,
      @required this.contact,
      this.isAtContact = false})
      : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<ProfileScreen> {
  bool loading = false;
  ContactBloc _contactBloc;
  Timer timer;
  bool _isAtContact = false;

  handleChat() {
    // todo 检查是否存在于聊天中，如果存在，则不发送创建聊天，直接导航到聊天
  }

  handleSaveContact() {
    setState(() {
      loading = true;
    });
    addContact({'userID': Int64.parseInt('${widget.contact.userID}')},
        (result) {
      if (result.hasError) {
        showFlushBar(result.res, context);
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
      } else {
        $WS.emit(UPDATE_CONTACT_LIST);
        if (mounted) {
          timer = Timer(
              Duration(milliseconds: $WS.heartBeatMilliseconds + 1000), () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _contactBloc = BlocProvider.of<ContactBloc>(context);
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
            // todo 检查是否在聊天列表中，如果在聊天列表中，直接进入聊天
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ContactWidget(
                  contact: widget.contact,
                  avatarSize: 64,
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10.0),
                  child: CupertinoButton(
                      padding: const EdgeInsets.all(12.0),
                      onPressed: handleChat,
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
    _contactBloc.dispose();
    super.dispose();
  }
}
