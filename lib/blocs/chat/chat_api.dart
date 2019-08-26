import 'dart:async';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api_util/api_util.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:fixnum/fixnum.dart';

class ChatApi {
  ChatGetChatsReq _ChatGetChatsReq = ChatGetChatsReq(); // 聊天列表
  ChatGetMembersReq _ChatGetMembersReq = ChatGetMembersReq(); // 聊天成员
  UserGetChatUserSuperscriptReq _UserGetChatUserSuperscriptReq =
      UserGetChatUserSuperscriptReq(); // 未读数
  ChatGetStateReadReq _ChatGetStateReadReq = ChatGetStateReadReq(); // 已读状态
  ChatCreateReq _ChatCreateReq = ChatCreateReq(); // 创建聊天
  ChatUpdateProfileReq _ChatUpdateProfileReq = ChatUpdateProfileReq(); // 更新群聊信息
  ChatAddMemberReq _ChatAddMemberReq = ChatAddMemberReq(); // 添加聊天成员
  // ChatSendMessageReq _ChatSendMessageReq = ChatSendMessageReq(); // 发送消息
  ChatSyncChatStateMessagesReq _ChatSyncChatStateMessagesReq =
      ChatSyncChatStateMessagesReq();

  ChatSetTypingReq _ChatSetTypingReq = ChatSetTypingReq();

  ChatGetChatStateMessagesReq _ChatGetChatStateMessagesReq =
      getChatStateMessagesReq(0, 20);
  ChatGetChatStateMessagesCondition _ChatGetChatStateMessagesCondition =
      ChatGetChatStateMessagesCondition();

  // 获取聊天列表
  Future<List<Chat>> getChats([bool sync = true]) async {
    Completer _completer = Completer<List<Chat>>();

    getChatList(_ChatGetChatsReq, (data) {
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        List<Chat> chats = data.res.chats;
        // 过滤掉联系人
        chats = chats.where((i) => i.chatType != 3).toList();

        print('sync $sync');
        if (sync) {
          // 获取未读数
          print('获取未读数');
          getChatsLastUnread(chats);

          // 获取最后一条消息
          print('获取最后一条消息');
          getChatsLastMsg(chats);
        }
        /*
          // 获取聊天成员
          getChatMembers(chats);

          // 获取已读状态
          getStateReads(chats);

          // 获取最后一条消息
          getChatMembers(chats);

          // 获取聊天历史记录
        */
        _completer.complete(chats);
      }
    });

    return _completer.future;
  }

  // 获取聊天成员
  // todo 如果万千人聊天群？得分页？
  Future<List<User>> getChatMembers(Chat chat) {
    Completer _completer = Completer<List<User>>();

    _ChatGetMembersReq.chatID = chat.chatID;
    getChatMemberIDs(_ChatGetMembersReq, (data) async {
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        UserGetFullUsersReq _UserGetFullUsersReq = UserGetFullUsersReq();
        getFullUsers(data.res.members, _UserGetFullUsersReq, (data) {
          if (data.hasError) {
            _completer.completeError(data.res);
          } else {
            _completer.complete(data.res.users);
          }
        });
      }
    });

    return _completer.future;
  }

  // 获取状态
  Future getMessages(Int64 chatID, int limit, [Int64 state]) {
    Completer _completer = Completer();
    _ChatSyncChatStateMessagesReq.clear();
    _ChatSyncChatStateMessagesReq.chatID = chatID;
    _ChatSyncChatStateMessagesReq.limit = limit;
    if (state != null) {
      _ChatSyncChatStateMessagesReq.state = state;
    }
    syncChatMessageState(_ChatSyncChatStateMessagesReq, (data) {
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        _completer.complete(data.res);
      }
    });
    return _completer.future;
  }

  Future<ChatGetChatStateMessagesResp> getMsgHistory(Int64 chatID,
      [List<int> messageTypes,
      int pageIndex,
      int pageSize,
      Int64 stateBefore,
      Int64 stateAfter]) {
    Completer _completer = Completer<ChatGetChatStateMessagesResp>();
    if (pageIndex != null) {
      _ChatGetChatStateMessagesReq.paging.pageIndex = Int64(pageIndex);
    }
    if (pageSize != null) {
      _ChatGetChatStateMessagesReq.paging.pageSize = Int64(pageSize);
    }

    _ChatGetChatStateMessagesCondition.clear();
    _ChatGetChatStateMessagesCondition.chatID = chatID;
    if (stateBefore != null) {
      _ChatGetChatStateMessagesCondition.stateBefore = stateBefore;
    }
    if (stateAfter != null) {
      _ChatGetChatStateMessagesCondition.stateAfter = stateAfter;
    }
    if (messageTypes != null) {
      for (var i in messageTypes) {
        _ChatGetChatStateMessagesCondition.messageTypes.add(i);
      }
    }
    _ChatGetChatStateMessagesReq.condition = _ChatGetChatStateMessagesCondition;

    queryChatMsgsByCondition(_ChatGetChatStateMessagesReq, (data) {
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        _completer.complete(data.res);
      }
    });
    return _completer.future;
  }

  // 获取最后一条消息
  Future getChatsLastMsg(List<Chat> chats) async {
    fn(i) async {
      try {
        var res = await getMsgHistory(i.chatID, [1, 2, 4], 0, 1);
        // 如果有最后一条消息，通知排序
        if (res.stateUpdates.length > 0) {
          $WS.emit(CHEvent.ON_CHAT_LAST_MSG, res.stateUpdates[0]);
          $WS.emit(CHEvent.ALL_MSG(i.chatID), res.stateUpdates[0]);
        }
      } catch (e) {
        print('chatID ${i.chatID} 获取最后一条消息失败 $e');
        Timer(Duration(seconds: 1), () {
          fn(i);
        });
      }
    }

    chats.forEach(fn);
  }

  // 获取未读数
  Future getChatsLastUnread(List<Chat> chats) async {
    chats.forEach((i) {
      _UserGetChatUserSuperscriptReq.chatID = i.chatID;
      getChatsLastUnreadState(_UserGetChatUserSuperscriptReq, (data) {
        if (data.hasError) {
          print('获取未读数出错 chatID-${i.chatID}: $data');
          return;
        }

        var unreadCount = data.res.superscriptNumber;
        $WS.emit(CHEvent.INIT_CHAT_UNREAD_ALL, {
          'type': 'init',
          'unreadCount': unreadCount,
          'chatID': i.chatID,
        });
      });
    });
  }

  // 查看该 Chat 中的最后已读消息 state
  Future getLastReadState(List<Chat> chats) async {
    chats.forEach((i) {
      _ChatGetStateReadReq.chatID = i.chatID;
      getStateRead(_ChatGetStateReadReq, (data) {
        print('${i.chatID}已读：');
        print(data.res);
      });
    });
  }

  Future create(String title, [Int64 avatarFileID]) async {
    Completer _completer = Completer();
    _ChatCreateReq.title = title;
    createGroupChat(_ChatCreateReq, (data) {
      print('创建聊天返回聊天对象 $data');
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        _completer.complete(data.res);
        if (avatarFileID != null) {
          updateProfile(data.res.chat.chatID, title, avatarFileID);
        }
      }
    });
    return _completer.future;
  }

  Future updateProfile(Int64 chatID, String title, Int64 avatarFileID) async {
    Completer _completer = Completer();
    _ChatUpdateProfileReq.title = title;
    _ChatUpdateProfileReq.chatID = chatID;
    _ChatUpdateProfileReq.avatarFileID = avatarFileID;
    updateChatProfile(_ChatUpdateProfileReq, (data) {
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        _completer.complete(data.res);
      }
    });
    return _completer.future;
  }

  Future addMembers(List<dynamic> members, Int64 chatID) async {
    if (members == null) return;
    _ChatAddMemberReq.chatID = chatID;
    members.forEach((i) {
      _ChatAddMemberReq.userID = i.userID;
      addMemberToChat(_ChatAddMemberReq, (data) {
        print('添加成员到指定聊天 ${i.userID}: $data');
      });
    });
  }

  Future sendMsg(Int64 chatID, int contentType,
      [String message, Int64 fileID]) async {
    ChatSendMessageReq _ChatSendMessageReq = ChatSendMessageReq();
    ChatMessage _ChatMessage = ChatMessage();
    _ChatMessage.chatID = chatID;
    _ChatMessage.contentType = contentType;
    if (message.isNotEmpty) {
      _ChatMessage.message = message;
    }
    if (contentType != ChatContentType.Text &&
        contentType != ChatContentType.Geo &&
        fileID != null) {
      _ChatMessage.fileID = fileID;
    }
    _ChatSendMessageReq.chatMessage = _ChatMessage;

    Completer _completer = Completer();
    sendChatMsg($WS.genRequestID(), _ChatSendMessageReq, (data) {
      print('发送��息返回：$data');
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        _completer.complete(data.res);
      }
    });
    return _completer.future;
  }

  sendTyping(Int64 chatID) {
    _ChatSetTypingReq.chatID = chatID;
    setChatTyping(_ChatSetTypingReq);
  }
}
