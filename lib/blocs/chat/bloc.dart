import 'dart:async';

import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'chat.dart';
import 'package:elk_chat/repositorys/chat_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({@required this.chatRepository});

  // @override
  // Stream<ChatState> transform(
  //   Stream<ChatEvent> events,
  //   Stream<ChatState> Function(ChatEvent event) next,
  // ) {
  //   return super.transform(
  //     (events as Observable<ChatEvent>).debounceTime(
  //       Duration(milliseconds: 100),
  //     ),
  //     next,
  //   );
  // }

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
    print(
        '$event; event is AddChat ${event is AddChat};currentState is ChatLoaded ${currentState is ChatLoaded}');

    if (event is AddChat) {
      if (currentState is ChatLoaded) {
        var chats = (currentState as ChatLoaded).chats.toList();
        var inChat = false;
        // 判断有没有在聊天中
        for (var i in chats) {
          if (i.chatID == event.chat.chatID) {
            inChat = true;
            break;
          }
        }
        print('inChat $inChat');
        if (!inChat) {
          chats.insert(0, event.chat);
          yield ChatLoaded(chats: chats);
        }
      }
    }

    if (event is DeleteChat) {
      var chats = (currentState as ChatLoaded)
          .chats
          .where((i) => i.chatID != event.chat.chatID)
          .toList();
      yield ChatLoaded(chats: chats);
    }

    if (event is ResortChatList) {
      var chats =
          resortChatByUpdateTime((currentState as ChatLoaded).chats.toList());
      yield ChatLoaded(chats: chats);
    }

    if (event is FetchChatList) {
      try {
        // final sortedChats = $CH.chats;
        final chats = await chatRepository.getChats(event.sync);
        // 提示更新完成+1
        if (event.emitUpdated) {
          $WS.emit(UPDATING);
        }
        yield ChatLoaded(chats: resortChatByUpdateTime(chats));
      } catch (_) {
        print('FetchChatList error: $_');
        if (event.emitUpdated) {
          $WS.emit(UPDATING);
        }
        yield ChatError();
      }
    }
  }
}
