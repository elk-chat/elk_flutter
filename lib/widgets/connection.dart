import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:elk_chat/init_websocket.dart';

Map<dynamic, String> WSStausTextMap = {
  WSStatus.connected: '已连接',
  WSStatus.connecting: ' 连接···',
  WSStatus.updating: ' 更新···',
  WSStatus.disconnected: '未连接',
};

/// websocket 状态展示
class Connection extends StatefulWidget {
  final String title;
  Connection({Key key, this.title}) : super(key: key);

  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  Function wsStatusSubscription;
  WSStatus currentStatus = $WS.currentStatus;
  Timer _timer;

  @override
  void initState() {
    super.initState();

    // 状态更新
    wsStatusSubscription = $WS.on(WS_STATUS, onStatusChange);
  }

  @override
  void dispose() {
    super.dispose();
    wsStatusSubscription();
  }

  onStatusChange(payload) {
    if (payload != null && currentStatus != payload.type) {
      _timer?.cancel();
      _timer = Timer(Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            currentStatus = payload.type;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var title = widget.title != null ? widget.title : 'connection';
    // 连接中（创建连接，token登录获取 SessiongID） / 更新中 / 等待网络连接
    //
    var title = widget.title;
    List<Widget> widgets = [];
    if (currentStatus != WSStatus.connected) {
      title = WSStausTextMap[currentStatus];
    }
    if (
      currentStatus == WSStatus.connecting ||
      currentStatus == WSStatus.updating
    ) {
      widgets.add(CupertinoActivityIndicator(
        radius: 10,
      ));
    }
    widgets.add(Text(title));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }
}
