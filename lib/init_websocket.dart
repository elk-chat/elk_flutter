import 'package:elk_chat/protocol/network/websocket.dart';
export 'package:elk_chat/protocol/network/ws_state.dart';

WebSocket $WS;

WebSocket initWS(String wsUrl, int pingInterval, [int timeout = 20]) {
  if ($WS == null) {
    $WS = WebSocket(wsUrl, pingInterval, timeout);
  }

  // 收到 RequestID 为 0 的推送消息，
  // 比如：消息已读/对方正在输入/有新的好友请求/有新消息等
  $WS.on(WS_RECEIVE_STATE_UPDATE, (payload) {
    print('收到推送消息：${payload['res']}');
  });
  return $WS;
}
