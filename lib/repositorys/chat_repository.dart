import 'dart:async';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';

/*

  getChatList({}, (data) {
      if (data.hasError) {
        print(data);
        return;
      }
      print('聊天列表:');
      print(data.res);
      return;
      var chats = data.res.chats.toList();
      var chatID = chats[2].chatID;
      print(chatID);
      getChatsLastUnreadState({'chatID': chatID}, (data) {
        print('未读状态:');
        print(data);
        getStateRead({'chatID': chatID}, (data) {
          print('最后已读状态消息：');
          print(data.res);
        });
      });
      getChatMemberIDs({'chatID': chatID}, (data) {
        print('聊天联系人：');
        print(data.res);
      });

      return;
      // 发送消息
      sendChatMsg({
        'chatID': chatID,
        'contentType': ChatContentType.Text,
        'message': '233456'
      }, (data) {
        print('发送聊天响应');
        print(data.res);
      });
      // 聊天标题
      // 未读数
      // 最后一条消息
      // 具体聊天内容
      // 具体成员列表
    });
*/

class ChatRepository {
  ChatGetChatsReq _ChatGetChatsReq = ChatGetChatsReq(); // 聊天列表

  // 获取聊天列表
  Future<List<Chat>> getChats() async {
    Completer _completer = Completer<List<Chat>>();

    getChatList(_ChatGetChatsReq, (data) {
      if (data.type == 'delay') {
        return;
      }
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        List<Chat> chats = data.res.chats;
        // 过滤掉联系人
        chats = chats.where((i) => i.chatType != 3).toList();
        _completer.complete(chats);
      }
    });

    return _completer.future;
  }
}
