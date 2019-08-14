// 信息分发中心，流程：获取 -》 查询数据库 -》数据库有返回 -》如果没有查接口返回并缓存
// 缓存：消息记录，用户列表，文件列表
// 消息推送流程：新消息到达 -》分类处理 -》缓存并广播事件
// protobuf 缓存流程：protobuf 数据 writeToJson 序列化为 json -》存进 sqlite

import 'package:fixnum/fixnum.dart';
// import 'package:meta/meta.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';

import 'package:elk_chat/protocol/util/event_emitter.dart';

class ChatHub extends EventEmitter {
  /// sqlite
  // final Database db;
  // ChatHub({@required this.db});

  Map<String, dynamic> test() {
    var user = User();
    user.userName = 'test';
    user.avatarFileID = Int64(100);
    var mapUser = user.writeToJsonMap();
    mapUser.forEach((tagNumber, value) {
      print(tagNumber);
      // var field = user(int.parse(tagNumber));
    });
    return mapUser;
  }

  rtest(String json) {
    var user = User.fromJson(json);
    print(user);
  }
}
