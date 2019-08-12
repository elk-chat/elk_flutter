import 'dart:async';

import 'package:elk_chat/init_websocket.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'chat.dart';
import 'package:elk_chat/repositorys/chat_repository.dart';

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
        // 提示更新完成+1
        $WS.emit(UPDATING);
        yield ChatLoaded(chats: chats, hasReachedMax: false);
      } catch (_) {
        print('FetchChatList error: $_');
        $WS.emit(UPDATING);
        yield ChatError();
      }
    }
  }

  bool _hasReachedMax(ChatState state) =>
      state is ChatLoaded && state.hasReachedMax;
}
