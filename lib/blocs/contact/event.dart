// 加载事件

import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

abstract class ContactEvent extends Equatable {}

class FetchContactList extends ContactEvent {
  final Int64 selfUserID;

  FetchContactList(this.selfUserID);

  @override
  String toString() => 'FetchContactList';
}

class AddContact extends ContactEvent {
  final User user;
  AddContact({@required this.user});

  @override
  String toString() => 'AddContact ${user.userID}';
}

class ClearContact extends ContactEvent {
  @override
  String toString() => 'ClearContact';
}
