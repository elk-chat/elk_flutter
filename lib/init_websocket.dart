import 'package:elk_chat/protocol/network/websocket.dart';
export 'package:elk_chat/protocol/network/ws_state.dart';
import 'package:elk_chat/chat_hub/chat_hub.dart';

WebSocket $WS;
ChatHub $CH;

WebSocket initWS(String wsUrl, int pingInterval, [int timeout = 20]) {
  if ($WS == null) {
    $WS = WebSocket(wsUrl, pingInterval, timeout);
    // ChatHub 消息分发处理
    $CH = ChatHub($WS);
  }
  return $WS;
}
