import 'dart:io';

import 'package:jpush_flutter/jpush_flutter.dart';

class JPushHelper {
  JPush jpush = JPush();

  getJpushRegisterID() async {
    return await jpush.getRegistrationID();
  }

  JPushHelper() {
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
    if(Platform.isAndroid) {
      jpush.setup(
        appKey: "845e4cf18a9766b289679c1e",
        // channel: "theChannel",
        production: false,
        debug: false, // 设置是否打印 debug 日志
      );
    }
  }
}
