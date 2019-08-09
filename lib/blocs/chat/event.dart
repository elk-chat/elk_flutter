// 加载事件

import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {}

class FetchChatList extends ChatEvent {
  @override
  String toString() => 'FetchChatList';
}

class ClearChat extends ChatEvent {
  @override
  String toString() => 'ClearChat';
}
