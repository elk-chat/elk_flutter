// 联系人相关接口
// import 'package:fixnum/fixnum.dart';

import '../network/websocket.dart';
import 'package:elk_chat/init_websocket.dart';
import '../protobuf/koi.pb.dart';

/**
 * 搜索用户
 */
searchUser(UserGetUsersReq proto, WebsocketCallback cb) {
  return $WS.send(method: "UserGetUsersReq", protobuf: proto, cb: cb);
}

/**
 * 添加联系人
 */
addContact(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "ContactAddReq",
      protobuf: ContactAddReq(),
      data: formData,
      cb: cb);
}

/**
 * 获取联系人列表
 */
getContactList(ContactGetContactsReq pto, WebsocketCallback cb) {
  return $WS.send(method: "ContactGetContactsReq", protobuf: pto, cb: cb);
}

/**
 * 删除联系人
 */
deleteContact(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "ContactDeleteReq",
      protobuf: ContactDeleteReq(),
      data: formData,
      cb: cb);
}

/**
 * 更新联系人信息
 */
updateContact(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "ContactUpdateReq",
      protobuf: ContactUpdateReq(),
      data: formData,
      cb: cb);
}

/**
 * 获取单个用户信息
 */
getFullUser(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "UserGetFullUserReq",
      protobuf: UserGetFullUserReq(),
      data: formData,
      cb: cb);
}

/**
 * 获取多个用户信息
 */
getFullUsers(userIDs, UserGetFullUsersReq pto, WebsocketCallback cb) {
  pto.userIDs.clear();
  for (var member in userIDs) {
    pto.userIDs.add(member.userID);
  }
  return $WS.send(method: "UserGetFullUsersReq", protobuf: pto, cb: cb);
}

/** 
 * 点击联系人详情，发送消息，初始化聊天信息
 * PeerID: 启动这个聊天的用户 userID
 */
initPeerChat(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "ChatInitiateReq",
      protobuf: ChatInitiateReq(),
      data: formData,
      cb: cb);
}
//
