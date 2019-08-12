import 'package:elk_chat/blocs/blocs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:elk_chat/repositorys/auth_repository.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// websocket 重连/消息同步
class ConnectionWatcher extends StatefulWidget {
  final dynamic authState;
  final AuthRepository authRepository;
  ConnectionWatcher(
      {Key key, @required this.authState, @required this.authRepository})
      : super(key: key);

  _ConnectionWatcherState createState() => _ConnectionWatcherState();
}

class _ConnectionWatcherState extends State<ConnectionWatcher> {
  Function heartBeatSubscription;
  Function wsStatusSubscription;
  Function authSubscription;
  Function updateFinishSubscription;
  Function logoutSupscription;
  final int MAX_UPDATING = 2; // 聊天列表/联系人列表
  int updateCount = 0;
  ChatBloc _chatBloc;
  ContactBloc _contactBloc;
  WSStatus currentStatus;
  DateTime lastUpdatingTime;

  bool isAuthing = false;

  @override
  void initState() {
    super.initState();

    // 收到心跳包
    heartBeatSubscription = $WS.on(WS_HEARTBEAT_DELAY, onHeartBeat);

    // 会话过期，重新登录
    authSubscription = $WS.on(B00006, onAuth);

    _chatBloc = BlocProvider.of<ChatBloc>(context);
    _contactBloc = BlocProvider.of<ContactBloc>(context);

    // 状态更新
    wsStatusSubscription = $WS.on(WS_STATUS, onStatusChange);

    updateFinishSubscription = $WS.on(UPDATING, onUpdating);

    logoutSupscription = $WS.on(LOGOUT, onLogout);
  }

  @override
  void dispose() {
    authSubscription();
    wsStatusSubscription();
    heartBeatSubscription();
    updateFinishSubscription();
    logoutSupscription();
    super.dispose();
  }

  onHeartBeat(payload) {
    print('心跳包：$payload');
  }

  onAuth(data) async {
    if (widget.authState is AuthAuthenticated) {
      if (isAuthing) {
        print('已经正在登录');
        return;
      }
      isAuthing = true;
      try {
        await widget.authRepository.handleLogin(widget.authState.account.token);
      } catch (e) {
        print('重新登录失败: $e');
      }
      isAuthing = false;
    }
  }

  onUpdating(payload) {
    if ($WS.isLogined) {
      updateCount++;
      if (MAX_UPDATING <= updateCount) {
        updateCount = 0;
        $WS.emitConnected();
      }
    }
  }

  onLogout(payload) {
    lastUpdatingTime = null;
    updateCount = 0;
  }

  onStatusChange(payload) async {
    print('onStatusChange payload $payload');
    if (widget.authState is AuthAuthenticated) {
      if (payload.type == WSStatus.disconnected) {
        print('连接断开，尝试重新连接');
        // $WS.checkWebsocketConnect();
      } else if (payload.type == WSStatus.connected ||
          payload.type == WSStatus.updating) {
        var now = DateTime.now();
        if (lastUpdatingTime != null) {
          var durationSeconds = now.difference(lastUpdatingTime).inSeconds;
          // 5 秒内避免再次同步
          if (durationSeconds <= 5) return;
        }
        lastUpdatingTime = now;
        print('已连接, 触发更新 updating $payload');
        _chatBloc.dispatch(FetchChatList());
        _contactBloc.dispatch(FetchContactList());
      }
    }
    currentStatus = payload.type;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
