// 加载事件

import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {}

class FetchContactList extends ContactEvent {
  @override
  String toString() => 'FetchContactList';
}

class ClearContact extends ContactEvent {
  @override
  String toString() => 'ClearContact';
}
