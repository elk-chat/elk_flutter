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
  final List<dynamic> chats;

  ChatLoaded({
    this.chats,
  }) : super([chats]);

  ChatLoaded copyWith({
    List<dynamic> chats,
  }) {
    return ChatLoaded(
      chats: chats ?? this.chats,
    );
  }

  @override
  String toString() => 'ChatLoaded { chats: ${chats.length}, }';
}
