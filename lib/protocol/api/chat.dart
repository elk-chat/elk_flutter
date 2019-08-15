/// 聊天相关接口
import '../network/websocket.dart';
import 'package:elk_chat/init_websocket.dart';
import '../protobuf/koi.pb.dart';

/// 获取聊天列表ID
getChatList(ChatGetChatsReq pto, WebsocketCallback cb) {
  return $WS.send(method: "ChatGetChatsReq", protobuf: pto, cb: cb);
}

/// 获取聊天的未读数
getChatsLastUnreadState(
    UserGetChatUserSuperscriptReq proto, WebsocketCallback cb,
    [UserGetChatUserSuperscriptResp resp]) {
  return $WS.send(
      method: "UserGetChatUserSuperscriptReq", protobuf: proto, cb: cb);
}

/// 查看该 Chat 中的最后已读消息
getStateRead(ChatGetStateReadReq proto, WebsocketCallback cb,
    [ChatGetStateReadResp resp]) {
  return $WS.send(method: "ChatGetStateReadReq", protobuf: proto, cb: cb);
}

/// 同步单个 Chat 的聊天状态
syncChatMessageState(ChatSyncChatStateMessagesReq proto, WebsocketCallback cb,
    [ChatSyncChatStateMessagesResp resp]) {
  return $WS.send(
      method: "ChatSyncChatStateMessagesReq", protobuf: proto, cb: cb);
}

/// 通过查询条件和分页控制，查询历史聊天信息
queryChatMsgsByCondition(
    ChatGetChatStateMessagesReq proto, WebsocketCallback cb,
    [ChatGetChatStateMessagesResp resp]) {
  return $WS.send(
      method: "ChatGetChatStateMessagesReq",
      protobuf: proto,
      queueID:
          '${proto.condition.chatID}_${proto.paging.pageIndex}_${proto.paging.pageSize}',
      cb: cb);
}

/// 创建群聊
createGroupChat(ChatCreateReq proto, WebsocketCallback cb,
    [ChatCreateResp resp]) {
  return $WS.send(method: "ChatCreateReq", protobuf: proto, cb: cb);
}

/** 
 * 点击联系人详情，发送消息，初始化聊天信息
 * PeerID: 启动这个聊天的用户 userID
 */
/// 创建单人聊天
initPeerChat(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "ChatInitiateReq",
      protobuf: ChatInitiateReq(),
      data: formData,
      cb: cb);
}

/// 向对应的聊天添加人员
addMemberToChat(ChatAddMemberReq proto, WebsocketCallback cb,
    [ChatAddMemberResp resp]) {
  return $WS.send(
      method: "ChatAddMemberReq",
      queueID: '${proto.userID}-${proto.chatID}',
      protobuf: proto,
      hasResponse: false,
      cb: cb);
}

/// 向对应的聊天添加人员列表
addMembersToChat(Map formData, WebsocketCallback cb) {
  /// [@Todo]
  /// 循环调用 addMemberToChat
}

/// 选择人员聊天，如果不存在就创建
createChatAndAddMember(Map formData, WebsocketCallback cb) {
  /// [@Todo]
  /// 调用创建聊天
  /// 调用添加联系人
}

/// 发送聊天消息
sendChatMsg(ChatSendMessageReq proto, WebsocketCallback cb,
    [ChatSendMessageResp resp]) {
  return $WS.send(method: "ChatSendMessageReq", protobuf: proto, cb: cb);
}

/// 正在输入
setChatTyping(ChatSetTypingReq proto, [ChatSetTypingResp resp]) {
  return $WS.send(method: "ChatSetTypingReq", protobuf: proto, hasResponse: false);
}

/// 告诉服务端，已收到消息
msgStateAck(StateAck proto) {
  return $WS.send(
      method: "StateAck",
      queueID: proto.messageID,
      protobuf: proto,
      hasResponse: false);
}

/// 告诉服务端，该消息已读
readMsg(ChatReadMessageReq proto, WebsocketCallback cb) {
  return $WS.send(method: "ChatReadMessageReq", protobuf: proto, cb: cb);
}

/// 查看 Chat 的已读消息
/// 暂时没看到哪里用到
// getChatReadState(Map formData, WebsocketCallback cb) {
//   return $WS.send(
//       method: "UserGetChatUserStateReq",
//       protobuf: UserGetChatUserStateReq(),
//       data: formData,
//       cb: cb);
// }

/// 获取多个聊天的历史记录
getChatsStates(Map formData, WebsocketCallback cb) {
  /// [@Todo]
  /// 多次调用查询聊天历史记录
}

/// 获取 Chat 中的联系人列表 ID
getChatMemberIDs(ChatGetMembersReq proto, WebsocketCallback cb,
    [ChatGetMembersResp resp]) {
  return $WS.send(method: "ChatGetMembersReq", protobuf: proto, cb: cb);
}

/// 获取 Chat 中的联系人列表
getChatMembers(Map formData, WebsocketCallback cb) {
  /// [@Todo]
  /// 首先获取联系人列表 ID
  /// 再根据 ID 循环获取联系人信息
}

/// 告诉服务器，在线/下线
// onlineStateAck(Map formData, WebsocketCallback cb) {
/// [@Todo]
// }
