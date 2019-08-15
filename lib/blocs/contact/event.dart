// 加载事件

import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart';

abstract class ContactEvent extends Equatable {}

class FetchContactList extends ContactEvent {
  final Int64 selfUserID;

  FetchContactList(this.selfUserID);

  @override
  String toString() => 'FetchContactList';
}

class ClearContact extends ContactEvent {
  @override
  String toString() => 'ClearContact';
}
