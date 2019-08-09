import 'dart:async';
import 'dart:typed_data';

import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api/api.dart';

class AuthRepository {
  final String AUTH_INFO = 'AUTH_INFO_2';
  SharedPreferences prefs;
  AuthRepository({@required this.prefs});
  final UserLoginReq _UserLoginReq = UserLoginReq();

  // 获取登录账户，当前登录账户信息，已保存账户列表
  Future<dynamic> getAuthInfo() async {
    List<String> auth_info = await prefs.getStringList(AUTH_INFO);
    Completer _completer = Completer();

    if (auth_info != null) {
      List<int> a = auth_info.map((i) => int.parse(i)).toList();
      var res = UserLoginResp.fromBuffer(Uint8List.fromList(a));
      // 自动登录
      if (res.token.isEmpty) {
        _completer.complete(res);
      } else {
        _UserLoginReq.clear();
        _UserLoginReq.token = res.token;
        login(_UserLoginReq, (data) {
          if (data.type == 'delay') {
            return;
          }
          if (data.hasError) {
            // todo 如果自动登录验证失败，需要使用用户名密码登录
            _completer.complete(res);
          } else {
            UserLoginResp res = data.res;
            persistAuthInfo(res);
            $WS.setSSID(data.res?.sessionID);
            $WS.heartBeat();

            _completer.complete(res);
          }
        });
      }
    } else {
      UserLoginResp account = UserLoginResp();
      _completer.complete(account);
    }
    return _completer.future;
  }

  // 登录
  Future<dynamic> auth({
    @required String userName,
    @required String password,
  }) async {
    if (userName.isEmpty || password.isEmpty) {
      throw '用户名或密码必填';
    }
    Completer _completer = Completer();

    _UserLoginReq.clear();
    _UserLoginReq.userName = userName;
    _UserLoginReq.password = password;
    login(_UserLoginReq, (data) {
      if (data.type == 'delay') {
        return;
      }
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        $WS.setSSID(data.res?.sessionID);
        $WS.heartBeat();
        _completer.complete(data.res);
      }
    });
    return _completer.future;
  }

  // 删除登录信息
  Future<dynamic> deleteAuthInfo() async {
    $WS.logout();
    List<String> auth_info = await prefs.getStringList(AUTH_INFO);
    List<int> a = auth_info.map((i) => int.parse(i)).toList();
    var res = UserLoginResp.fromBuffer(Uint8List.fromList(a));
    res.token = '';
    await persistAuthInfo(res);
    return res;
  }

  // 保存登录信息
  Future<UserLoginResp> persistAuthInfo(UserLoginResp authInfo) async {
    /// write to keystore/keychain
    var buffer = authInfo.writeToBuffer();
    var list = buffer.map((i) => i.toString()).toList();
    await prefs.setStringList(AUTH_INFO, list);
    return authInfo;
  }
}
