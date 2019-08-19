// 加载事件

import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ChatEvent extends Equatable {}

class FetchChatList extends ChatEvent {
  @override
  String toString() => 'FetchChatList';
}

class ResortChatList extends ChatEvent {
  @override
  String toString() => 'ResortChatList';
}

class AddChat extends ChatEvent {
  final Chat chat;
  AddChat({@required this.chat});

  @override
  String toString() => 'AddChat';
}

class ClearChat extends ChatEvent {
  @override
  String toString() => 'ClearChat';
}
