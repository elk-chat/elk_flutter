import 'dart:async';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/protocol/api/chat.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:fixnum/fixnum.dart';

class ChatRepository {
  ChatGetChatsReq _ChatGetChatsReq = ChatGetChatsReq(); // 聊天列表
  ChatGetMembersReq _ChatGetMembersReq = ChatGetMembersReq(); // 聊天成员
  UserGetChatUserSuperscriptReq _UserGetChatUserSuperscriptReq =
      UserGetChatUserSuperscriptReq(); // 未读数
  ChatGetStateReadReq _ChatGetStateReadReq = ChatGetStateReadReq(); // 已读状态
  ChatCreateReq _ChatCreateReq = ChatCreateReq(); // 创建聊天
  ChatAddMemberReq _ChatAddMemberReq = ChatAddMemberReq(); // 添加聊天成员
  ChatSendMessageReq _ChatSendMessageReq = ChatSendMessageReq(); // 发送消息
  UserGetFullUsersReq _UserGetFullUsersReq = UserGetFullUsersReq();
  ChatSyncChatStateMessagesReq _ChatSyncChatStateMessagesReq =
      ChatSyncChatStateMessagesReq();

  // 获取聊天列表
  Future<List<Chat>> getChats() async {
    Completer _completer = Completer<List<Chat>>();

    getChatList(_ChatGetChatsReq, (data) {
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        List<Chat> chats = data.res.chats;
        // 过滤掉联系人
        chats = chats.where((i) => i.chatType != 3).toList().reversed.toList();

        /*
          // 获取未读数
          getChatsLastUnread(chats);

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

  // 获取
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

  // 获取未读数
  Future getChatsLastUnread(List<Chat> chats) async {
    chats.forEach((i) {
      _UserGetChatUserSuperscriptReq.chatID = i.chatID;
      getChatsLastUnreadState(_UserGetChatUserSuperscriptReq, (data) {
        print('${i.chatID}未读数：');
        print(data.res);
      });
    });
  }

  Future getStateReads(List<Chat> chats) async {
    chats.forEach((i) {
      _ChatGetStateReadReq.chatID = i.chatID;
      getStateRead(_ChatGetStateReadReq, (data) {
        print('${i.chatID}已读：');
        print(data.res);
      });
    });
  }

  Future create(String title) async {
    _ChatCreateReq.title = title;
    createChat(_ChatCreateReq, (data) {
      print('创建聊天返回聊天对象 $data');
    });
  }

  Future addMember(List<User> members, Int64 chatID) async {
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
    _ChatSendMessageReq.chatID = chatID;
    _ChatSendMessageReq.contentType = contentType;
    if (message.isNotEmpty) {
      _ChatSendMessageReq.message = message;
    }
    if (contentType != ChatContentType.Text && fileID != null) {
      _ChatSendMessageReq.fileID = fileID;
    }
    sendChatMsg(_ChatSendMessageReq, (data) {
      print('发送消息返回：$data');
    });
  }
}
