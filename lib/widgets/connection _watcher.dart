import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
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
  Function chatListSubscription;
  Function contactListSubscription;
  Function resortChatListSubscription;
  Function addChatSubscription;

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

    contactListSubscription = $WS.on(UPDATE_CONTACT_LIST, (data) {
      _contactBloc.dispatch(FetchContactList($WS.user.userID));
    });

    chatListSubscription = $WS.on(UPDATE_CHAT_LIST, (data) {
      _chatBloc.dispatch(FetchChatList(emitUpdated: true, sync: true));
    });

    resortChatListSubscription =
        $WS.on(CHEvent.SORT_CHATS_BY_LAST_MSG, (payload) {
      _chatBloc.dispatch(ResortChatList());
    });

    addChatSubscription = $WS.on(CHEvent.ADD_CHAT, (payload) {
      if (payload.senderID == $WS.user.userID) return;
      UpdateMessage updMsg = payload.updateMessage;
      Chat chat = Chat();
      chat.chatID = payload.chatID;
      chat.createAt = payload.actionTime;
      chat.updatedAt = payload.actionTime;
      print('add chat $chat');
      if (updMsg.hasUpdateMessageChatAddMember()) {
        chat.chatType = ChatType.Group;
        print('add chat group $chat');
      } else if (updMsg.hasUpdateMessageChatSendMessage()) {
        /*
          chatID: 218
          senderID: 98
          messageID: 383474961559326720
          messageType: 1
          state: 1
          actionTime: 1566230443
          updateMessage: {
            updateMessageChatSendMessage: {
              chatID: 218
              senderName: jj2
              message: qwe
              contentType: 1
              actionTime: 1566230443
            }
          }
        */
        chat.chatType = ChatType.OneToOne;
        print('add chat one to one $chat');
      }
      // 如果是群聊天，再去获取一次群列表
      if (chat.chatType == ChatType.Group) {
        _chatBloc.dispatch(FetchChatList(emitUpdated: false, sync: false));
      }
      // 缺点：群聊天没有标题和头像，如果是群聊天，那么触发获取最新聊天列表
      _chatBloc.dispatch(AddChat(chat: chat));
    });
  }

  @override
  void dispose() {
    addChatSubscription();
    authSubscription();
    wsStatusSubscription();
    heartBeatSubscription();
    updateFinishSubscription();
    logoutSupscription();
    chatListSubscription();
    contactListSubscription();
    resortChatListSubscription();
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
        print('正在登录...');
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
    if (isAuthing) return;
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
          if (durationSeconds <= 5) {
            print('避免触发更新，avoid updating');
            return;
          }
        }
        if ($WS.isLogined) {
          lastUpdatingTime = now;
          print('已连接, 触发更新 updating $payload');
          $WS.emit(UPDATE_CONTACT_LIST);
          $WS.emit(UPDATE_CHAT_LIST);
        }
      }
    }
    currentStatus = payload.type;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
