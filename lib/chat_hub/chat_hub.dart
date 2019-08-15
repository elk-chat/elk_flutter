// chathub

import 'package:elk_chat/protocol/network/websocket.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/protocol/api/chat.dart';
import 'package:elk_chat/chat_hub/const.dart';

class ChatHub {
  WebSocket $WS;

  ChatHub(WebSocket $WS) {
    this.$WS = $WS;

    $WS.on(WS_RECEIVE_STATE_UPDATE, (payload) {
      /*
      字段 
      ..aInt64(1, 'chatID')
      ..aInt64(2, 'senderID')
      ..a<Int64>(3, 'messageID', $pb.PbFieldType.OU6, Int64.ZERO)
      ..a<$core.int>(4, 'messageType', $pb.PbFieldType.O3)
      ..a<Int64>(5, 'state', $pb.PbFieldType.OU6, Int64.ZERO)
      ..aInt64(6, 'actionTime')
      */
      StateUpdate res = payload['res'];
      // 告诉服务端，消息已收到
      receivedMsgAck(res);

      // 目前六种类型：
      /*
        ..aInt64(1, 'chatID')
        ..aOS(2, 'senderName')
        ..aOS(3, 'addedMemeberName')

        updateMessageChatAddMember： 添加成员

        ..aInt64(1, 'chatID')
        ..aOS(2, 'senderName')
        ..aOS(3, 'deletedMemeberName')

        updateMessageChatDeleteMember： 移除成员


        ..aInt64(1, 'chatID')
        ..aOS(2, 'senderName')
        ..aOS(3, 'message')
        ..a<$core.int>(4, 'contentType', $pb.PbFieldType.O3)
        ..aInt64(5, 'fileID')
        ..aInt64(6, 'actionTime')

        updateMessageChatSendMessage：发送消息


        ..aInt64(1, 'chatID')
        ..aOS(2, 'senderName')
        ..a<Int64>(3, 'stateRead', $pb.PbFieldType.OU6, Int64.ZERO)

        updateMessageChatReadMessage： 消息已读

        ..aInt64(1, 'chatID')
        ..aOS(2, 'senderName')

        updateMessageChatSetTyping： 正在输入

        ..aInt64(1, 'chatID')
        ..aOS(2, 'senderName')
        ..a<Int64>(3, 'stateDeleted', $pb.PbFieldType.OU6, Int64.ZERO)

        updateMessageChatDeleteMessage： 删除消息
      */

      UpdateMessage updMsg = res.updateMessage;
      String eventName;
      print('收到推送消息：$res updMsg: $updMsg');

      if (updMsg.hasUpdateMessageChatAddMember()) {
        eventName = CHEvent.ADD_MEMBER(res.chatID);
      } else if (updMsg.hasUpdateMessageChatDeleteMember()) {
        eventName = CHEvent.DELETE_MEMBER(res.chatID);
      } else if (updMsg.hasUpdateMessageChatSendMessage()) {
        eventName = CHEvent.SEND_MSG(res.chatID, res.messageID);
      } else if (updMsg.hasUpdateMessageChatReadMessage()) {
        eventName = CHEvent.READ_MSG(res.chatID, res.messageID);
      } else if (updMsg.hasUpdateMessageChatDeleteMessage()) {
        eventName = CHEvent.DELETE_MSG(res.chatID, res.messageID);
      } else if (updMsg.hasUpdateMessageChatSetTyping()) {
        eventName = CHEvent.SET_TYPING(res.chatID);
      }

      $WS.emit(eventName, res);
      $WS.emit(CHEvent.ALL_MSG(res.chatID), res);
    });
  }

  // 告诉服务端，消息已收到
  receivedMsgAck(StateUpdate su) {
    var ack = StateAck();
    ack.chatID = su.chatID;
    ack.messageID = su.messageID;
    // ack.state = su.state;
    msgStateAck(ack);
  }
}
