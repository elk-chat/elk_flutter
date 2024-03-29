import 'dart:async';

import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api_util/api_util.dart';
import 'package:elk_chat/jpush/jpush.dart';

class AuthApi {
  final String AUTH_INFO = 'AUTH_INFO';
  SharedPreferences prefs;
  AuthApi({@required this.prefs});
  final UserLoginReq userLoginReq = UserLoginReq();
  JPushHelper jpushHelper = JPushHelper();

  // 获取当前登录账户信息，已保存账户列表
  Future<dynamic> getAuthInfo() async {
    String auth_info = await prefs.getString(AUTH_INFO);
    Completer _completer = Completer();

    if (auth_info != null) {
      UserLoginResp loginResp = UserLoginResp.fromJson(auth_info);
      if (loginResp.token.isNotEmpty) {
        // $WS.setSSID(loginResp);
        $CH.setLoginResp(loginResp);
      }
      _completer.complete(loginResp);
    } else {
      _completer.complete(UserLoginResp());
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
    userLoginReq.clear();
    userLoginReq.userName = userName;
    userLoginReq.password = password;
    return handleLogin();
  }

  handleLogin([String token]) async {
    if (token != null) {
      userLoginReq.clear();
      userLoginReq.token = token;
    }
    Completer _completer = Completer();
    // 添加极光推送的 registerID
    userLoginReq.jPushRegistrationID = await jpushHelper.getJpushRegisterID();
    login(userLoginReq, (data) {
      if (data.hasError) {
        _completer.completeError(data.res);
      } else {
        _completer.complete(data.res);
        $WS.setSSID(data.res);
        $CH.setLoginResp(data.res);
        persistAuthInfo(data.res);
      }
    });
    return _completer.future;
  }

  // 删除登录信息
  Future<dynamic> deleteAuthInfo() async {
    $WS.logout();
    String auth_info = await prefs.getString(AUTH_INFO);
    var res = UserLoginResp.fromJson(auth_info);
    res.token = '';
    await persistAuthInfo(res);
    return res;
  }

  // 保存登录信息
  Future<UserLoginResp> persistAuthInfo(UserLoginResp authInfo) async {
    /// write to keystore/keychain
    var buffer = authInfo.writeToJson();
    await prefs.setString(AUTH_INFO, buffer);
    return authInfo;
  }
}
