import 'dart:async';

import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'chat.dart';
import '../../repositorys/chat_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({@required this.chatRepository});

  @override
  Stream<ChatState> transform(
    Stream<ChatEvent> events,
    Stream<ChatState> Function(ChatEvent event) next,
  ) {
    return super.transform(
      (events as Observable<ChatEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => ChatUninitialized();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ClearChat) {
      // yield ChatLoaded(chats: [], hasReachedMax: false);
      yield ChatUninitialized();
    }
    if (event is FetchChatList && !_hasReachedMax(currentState)) {
      try {
        final chats = await chatRepository.getChats();
        print('chats: $chats');
        yield ChatLoaded(chats: chats, hasReachedMax: false);
        return;
      } catch (_) {
        print(_);
        yield ChatError();
      }
    }
  }

  bool _hasReachedMax(ChatState state) =>
      state is ChatLoaded && state.hasReachedMax;
}
