import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:elk_chat/repositorys/auth_repository.dart';
import 'package:elk_chat/init_websocket.dart';

/// websocket 重连/消息同步
class ConnectionWatcher extends StatefulWidget {
  final AuthRepository authRepository;
  ConnectionWatcher({Key key, @required this.authRepository}) : super(key: key);

  _ConnectionWatcherState createState() => _ConnectionWatcherState();
}

class _ConnectionWatcherState extends State<ConnectionWatcher> {
  Function heartBeatSubscription;
  Function wsStatusSubscription;
  WSStatus currentStatus;
  Timer syncTimer;
  bool firstSync = false;

  @override
  void initState() {
    // 状态更新
    wsStatusSubscription = $WS.on(WS_STATUS, onStatusChange);

    // 收到心跳包
    heartBeatSubscription = $WS.on(WS_HEARTBEAT_DELAY, onHeartBeat);

    // 第一次登录，同步
    syncTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if ($WS.currentStatus == WSStatus.connected) {
        syncTimer.cancel();
        syncState();
        firstSync = true;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    syncTimer?.cancel();
    wsStatusSubscription();
    heartBeatSubscription();
    super.dispose();
  }

  onHeartBeat(payload) {
    print('心跳包：$payload');
  }

  onStatusChange(payload) async {
    if (payload == null || currentStatus == payload.type) return;

    if (payload.type == WSStatus.disconnected) {
      // $WS.checkWebsocketConnect();
    } else if (payload.type == WSStatus.connected &&
        currentStatus != WSStatus.updating) {
      if ($WS.currentStatus == WSStatus.connected) {
        // 连接成功，自动登录，同步信息
        try {
          await widget.authRepository.getAuthInfo();
          if (firstSync) {
            syncState();
          }
        } catch (e) {
          //
        }
      }
    }
    currentStatus = payload.type;
  }

  ///  同步数据
  syncState() {
    $WS.emitUpdating();
    // print('开始同步数据，联系人/聊天列表/未读');
    Timer(Duration(seconds: 2), () {
      $WS.emitConnected();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
