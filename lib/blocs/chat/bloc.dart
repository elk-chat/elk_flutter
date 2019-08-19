import 'dart:async';

import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
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

  resortChatByUpdateTime(List<Chat> chats) {
    for (var i in chats) {
      if ($CH.lastMsgMap[i.chatID] != null) {
        i.updatedAt = $CH.lastMsgMap[i.chatID].actionTime;
      }
    }
    chats.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return chats;
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ClearChat) {
      // yield ChatLoaded(chats: [], hasReachedMax: false);
      yield ChatUninitialized();
    }

    if (event is AddChat) {
      if (currentState is ChatLoaded) {
        var chats = List.from((currentState as ChatLoaded).chats)
          ..insert(0, event.chat);
        yield ChatLoaded(chats: chats);
      }
    }

    if (event is ResortChatList) {
      var chats =
          resortChatByUpdateTime(List.from((currentState as ChatLoaded).chats));
      yield ChatLoaded(chats: chats);
    }

    if (event is FetchChatList) {
      try {
        // final sortedChats = $CH.chats;
        final chats = await chatRepository.getChats();
        // 提示更新完成+1
        $WS.emit(UPDATING);
        yield ChatLoaded(chats: resortChatByUpdateTime(chats));
      } catch (_) {
        print('FetchChatList error: $_');
        $WS.emit(UPDATING);
        yield ChatError();
      }
    }
  }
}
