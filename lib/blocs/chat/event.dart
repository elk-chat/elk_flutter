// 加载事件

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ChatEvent extends Equatable {}

class FetchChatList extends ChatEvent {
  @override
  String toString() => 'FetchChatList';
}

class SortChatList extends ChatEvent {
  final List chats;

  SortChatList({@required this.chats});

  @override
  String toString() => 'SortChatList: length ${chats.length}';
}

class ClearChat extends ChatEvent {
  @override
  String toString() => 'ClearChat';
}
