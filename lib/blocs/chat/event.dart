// 加载事件

import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ChatEvent extends Equatable {}

class FetchChatList extends ChatEvent {
  // 是否触发已完成更新
  final bool emitUpdated;
  // 是否同步数据
  final bool sync;

  FetchChatList({@required this.emitUpdated, @required this.sync});

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
