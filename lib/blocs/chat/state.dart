import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  ChatState([List props = const []]) : super(props);
}

class ChatUninitialized extends ChatState {
  @override
  String toString() => 'ChatUninitialized';
}

class ChatError extends ChatState {
  @override
  String toString() => 'ChatError';
}

class ChatLoaded extends ChatState {
  final List<Chat> chats;
  final bool hasReachedMax;

  ChatLoaded({
    this.chats,
    this.hasReachedMax,
  }) : super([chats, hasReachedMax]);

  ChatLoaded copyWith({
    List<Chat> chats,
    bool hasReachedMax,
  }) {
    return ChatLoaded(
      chats: chats ?? this.chats,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'ChatLoaded { chats: ${chats.length}, hasReachedMax: $hasReachedMax }';
}
