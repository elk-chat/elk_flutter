// chathub

import 'dart:async';

// import 'package:elk_chat/protocol/api/state.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/network/websocket.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/protocol/api/chat.dart';
import 'package:elk_chat/chat_hub/const.dart';
import 'package:fixnum/fixnum.dart';

class ChatHub {
  WebSocket $WS;
  // 聊天列表数据
  // List _chats = [
  //   {
  //     'chat': {}, // 聊天信息
  //     'members': [], // 聊天成员
  //     'msgs': [], // 信息列表
  //     'unread': 0, // 未读
  //   },
  // ];

  // 当前已经登录的 User
  UserLoginResp _loginResp;
  User get user => _loginResp.user;
  UserLoginResp get loginResp => _loginResp;

  // 聊天未读数映射
  Map<Int64, Int64> unreadMap = {};

  // 聊天最后更新时间映射
  Map<Int64, StateUpdate> lastMsgMap = {};

  // 发送消息列表映射, chatID: [requestID]
  Map<Int64, List<Map>> msgQueueMap = {};
  // requestID: _ChatSendMessadgeReqStr requestID
  // Map<Int64, List<StateUpdate>> _queueMsgs = {};

  // 文件上传映射，选择文件，获取本地 path，开始上传，上传成功，移除
  Map<Int64, dynamic> uploadFileQueueMap = {};

  ChatHub(WebSocket $WS) {
    this.$WS = $WS;
    // 服务端推送消息
    $WS.on(WS_RECEIVE_STATE_UPDATE, onReceiveMsg);

    // 未读
    $WS.on(CHEvent.INIT_CHAT_UNREAD_ALL, onUnreadMsg);

    // 聊天列表排序：获取到聊天列表每个聊天的最后一条消息创建时间，进行排序
    $WS.on(CHEvent.ON_CHAT_LAST_MSG, onLastMsg);

    // 聊天队列
    // $WS.on(CHEvent.ADD_MSG_TO_QUEUE, onAddMsgQueue);
    // $WS.on(CHEvent.REMOVE_MSG_FROM_QUEUE, onAddMsgQueue);
    // $WS.on(CHEvent.SEND_MSG_ERROR, onSendMsgError);
  }

  setLoginResp(UserLoginResp loginResp) {
    _loginResp = loginResp;
  }

  /*
    _ChatSendMessageReqStr: _ChatSendMessageReq.writeToJson()
  */
  // addMsgToQueue(String _ChatSendMessageReqStr) {
  //   BigInt requestID = $WS.genRequestID();
  //   ChatSendMessageReq _ChatSendMessageReq =
  //       ChatSendMessageReq.fromJson(_ChatSendMessageReqStr);
  //   var chatID = _ChatSendMessageReq.chatID;
  //   if (msgQueueMap[chatID] == null) {
  //     msgQueueMap[chatID] = [];
  //   }

  //   msgQueueMap[chatID].add({
  //     'requestID': requestID,
  //     'reqStr': _ChatSendMessageReqStr,
  //   });

  //   _queueMsgs[chatID]
  //       .add(transfromChatSendMessageReqToStateUpdate(_ChatSendMessageReq));
  //   // 给聊天窗口
  //   $WS.emit(CHEvent.ADD_MSG_TO_QUEUE(chatID), _queueMsgs[chatID]);
  //   sendChatMsg(requestID, _ChatSendMessageReq, (data) {
  //     print('发送消息返回：$data');
  //     if (data.hasError) {

  //     } else {

  //     }
  //   });
  // }

  // List<StateUpdate> getQueueMsgs(Int64 chatID) {
  //   if (_queueMsgs[chatID] != null) {
  //     return _queueMsgs[chatID];
  //   }
  //   if (msgQueueMap[chatID] != null) {
  //     for (var map in msgQueueMap[chatID]) {
  //       _queueMsgs[chatID]
  //           .add(transfromChatSendMessageReqToStateUpdate(map['reqStr']));
  //     }
  //   }
  //   return _queueMsgs[chatID];
  // }

  /*
    ..aInt64(1, 'chatID')
    ..aInt64(2, 'senderID')
    ..a<Int64>(3, 'messageID', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<$core.int>(4, 'messageType', $pb.PbFieldType.O3)
    ..a<Int64>(5, 'state', $pb.PbFieldType.OU6, Int64.ZERO)
    ..aInt64(6, 'actionTime')
    ..a<UpdateMessage>(7, 'updateMessage', $pb.PbFieldType.OM, UpdateMessage.getDefault, UpdateMessage.create)
  */
  // StateUpdate transfromChatSendMessageReqToStateUpdate(
  //     ChatSendMessageReq _cmq) {
  //   StateUpdate _su = StateUpdate();
  //   _su.senderID = $CH.user.userID;
  //   _su.chatID = _cmq.chatID;
  //   _su.messageType = ChatMessageType.SendMessage;
  //   UpdateMessage _UpdateMessage = UpdateMessage();
  //   /*
  //   .aInt64(1, 'chatID')
  //   ..aOS(2, 'senderName')
  //   ..aOS(3, 'message')
  //   ..a<$core.int>(4, 'contentType', $pb.PbFieldType.O3)
  //   ..aInt64(5, 'fileID')
  //   ..aInt64(6, 'actionTime')
  //   ..a<Markup>(7, 'markup', $pb.PbFieldType.OM, Markup.getDefault, Markup.create)
  //   */

  //   UpdateMessageChatSendMessage _UpdateMessageChatSendMessage =
  //       UpdateMessageChatSendMessage();

  //   _UpdateMessageChatSendMessage.chatID = _cmq.chatID;
  //   _UpdateMessageChatSendMessage.senderName = $CH.user.userName;
  //   _UpdateMessageChatSendMessage.message = _cmq.message;
  //   _UpdateMessageChatSendMessage.contentType = _cmq.contentType;
  //   _UpdateMessageChatSendMessage.fileID = _cmq.fileID;

  //   _UpdateMessage.updateMessageChatSendMessage = _UpdateMessageChatSendMessage;
  //   _su.updateMessage = _UpdateMessage;

  //   return _su;
  // }

  emitSort() {
    $WS.emit(CHEvent.SORT_CHATS_BY_LAST_MSG);
  }

  Timer sortTimer;

  onLastMsg(payload) {
    if (payload == null) return;
    var chatID = payload.chatID, stateUpdate = payload;
    // var notInChatList = lastMsgMap[chatID] == null;
    lastMsgMap[chatID] = stateUpdate;
    // if (notInChatList) return;
    if (sortTimer != null) {
      print('取消排序延迟200ms');
      sortTimer?.cancel();
    }
    sortTimer = Timer(Duration(milliseconds: 200), () {
      emitSort();
      sortTimer = null;
    });
  }

  getLastMsg(Int64 chatID) {
    return lastMsgMap[chatID] != null ? [lastMsgMap[chatID]] : [];
  }

  // 收到未读数
  onUnreadMsg(payload) {
    var type = payload['type'], chatID = payload['chatID'];
    if (unreadMap[chatID] == null) {
      unreadMap[chatID] = Int64(0);
    }
    if (type == 'init') {
      var unreadCount = payload['unreadCount'];
      unreadMap[chatID] = unreadCount;
    } else if (type == 'increase') {
      unreadMap[chatID]++;
    } else if (type == 'decrease') {
      unreadMap[chatID]--;
    } else if (type == 'decrease') {
      if (unreadMap[chatID] == 0) {
        print('chat $chatID 未读错误!');
      }
      unreadMap[chatID]--;
    }

    $WS.emit(CHEvent.INIT_CHAT_UNREAD(chatID), unreadMap[chatID]);
    $WS.emit(CHEvent.GET_ALL_CHAT_UNREAD, getAllUnreadCount());
  }

  // 获取 chat 未读
  Int64 getUnreadCount(chatID) {
    if (unreadMap[chatID] == null) {
      unreadMap[chatID] = Int64(0);
    }
    return unreadMap[chatID];
  }

  // 获取所有未读，显示在导航栏底部
  Int64 getAllUnreadCount() {
    Int64 unreadCount = Int64(0);
    unreadMap.forEach((chatID, count) {
      unreadCount += count;
    });
    return unreadCount;
  }

  // 告诉服务端，消息已收到
  receivedMsgAck(StateUpdate su) {
    var ack = StateAck();
    ack.chatID = su.chatID;
    ack.messageID = su.messageID;
    // ack.state = su.state;
    msgStateAck(ack);
  }

  onReceiveMsg(payload) {
    if (payload['hasError']) {
      print('收到推送消息失败 $payload');
      return;
    } else {
      print('收到推送消息 ${payload['res']}');
    }
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

        updateMessageChatReadMessage�� 消息已读

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
    bool messageUpdate = true;
    bool addChat = false;
    print('unreadMap[res.chatID] ${unreadMap[res.chatID]}');
    if (updMsg.hasUpdateMessageChatAddMember()) {
      addChat = unreadMap[res.chatID] == null;
      // 触发排序
      $WS.emit(CHEvent.ON_CHAT_LAST_MSG, res);

      eventName = CHEvent.ADD_MEMBER(res.chatID);
    } else if (updMsg.hasUpdateMessageChatSendMessage()) {
      // 收到新消息
      addChat = unreadMap[res.chatID] == null;
      // 触发排序
      $WS.emit(CHEvent.ON_CHAT_LAST_MSG, res);

      // 发消息，如果当前没有这个聊天，就创建
      eventName = CHEvent.SEND_MSG(res.chatID, res.messageID);
      // 未读+1，已读就在渲染里面加，如果未读，又渲染了的话 未读 -1
      // 如果是自己的推送消息���不管
      if (res.senderID != $CH.user.userID) {
        $WS.emit(CHEvent.INIT_CHAT_UNREAD_ALL,
            {'type': 'increase', 'chatID': res.chatID});
      } else {
        print('自己的消息推送，未读不+1');
      }
    } else if (updMsg.hasUpdateMessageChatDeleteMember()) {
      eventName = CHEvent.DELETE_MEMBER(res.chatID);

      // 触发排序
      $WS.emit(CHEvent.ON_CHAT_LAST_MSG, res);
    } else if (updMsg.hasUpdateMessageChatReadMessage()) {
      messageUpdate = false;
      eventName = CHEvent.READ_MSG(res.chatID);
      // eventName = CHEvent.READ_MSG_2(res.chatID, res.messageID);
    } else if (updMsg.hasUpdateMessageChatDeleteMessage()) {
      messageUpdate = false;
      eventName = CHEvent.DELETE_MSG(res.chatID, res.messageID);
    } else if (updMsg.hasUpdateMessageChatSetTyping()) {
      messageUpdate = false;
      eventName = CHEvent.SET_TYPING(res.chatID);
    }

    $WS.emit(eventName, res);
    if (messageUpdate) {
      $WS.emit(CHEvent.ALL_MSG(res.chatID), res);
    }
    if (addChat) {
      $WS.emit(CHEvent.ADD_CHAT, res);
    }
  }

  clear() {
    unreadMap = {};
    lastMsgMap = {};
    sortTimer?.cancel();
  }
}
