import 'package:elk_chat/protocol/network/websocket.dart';
export 'package:elk_chat/protocol/network/ws_state.dart';
import 'package:elk_chat/chat_hub/chat_hub.dart';
import 'package:elk_chat/blocs/blocs.dart';

export 'package:elk_chat/chat_hub/const.dart';

WebSocket $WS;
ChatHub $CH;

WebSocket initWS(
  String wsUrl, 
  int pingInterval, 
  int timeout, 
  AuthApi authApi,
  ChatApi chatApi,
  ContactApi contactApi
) {
  if ($WS != null) {
    print('调用了多次 initWS，请检查代码');
  }
  $WS = WebSocket(wsUrl, pingInterval, timeout);
  // ChatHub 消息分发处理
  $CH = ChatHub($WS, authApi, chatApi, contactApi);
  return $WS;
}
