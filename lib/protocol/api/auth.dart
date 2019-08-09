/// 登录/注册/自动登录/退出登录
/// 修改密码/修改头像
import '../network/websocket.dart';
import 'package:elk_chat/init_websocket.dart';
import '../protobuf/koi.pb.dart';

/// 登录/自动登录
login(UserLoginReq proto, WebsocketCallback cb) {
  return $WS.send(method: "UserLoginReq", protobuf: proto, cb: cb);
}

/// 注册
register(UserRegisterReq proto, WebsocketCallback cb) {
  return $WS.send(method: "UserRegisterReq", protobuf: proto, cb: cb);
}

/// 退出登录
logout(UserLogoutReq proto, [WebsocketCallback cb]) {
  return $WS.send(method: "UserLogoutReq", protobuf: proto, cb: cb);
}

/// 更改密码
changeLoginPwd(Map formData, WebsocketCallback cb) {
  // @Todo
}

/// 更改头像
changeAvatar(Map formData, WebsocketCallback cb) {
  // @Todo
}
