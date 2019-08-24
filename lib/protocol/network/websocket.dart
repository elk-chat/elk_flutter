import 'dart:async';
import 'dart:typed_data';
import 'dart:math';
// 这里使用 web_socket_channel/io.dart，而不是 dart:html Websocket，因为 dart:html Websocket 是给浏览器用的，
// flutter 环境用不了。
import 'package:web_socket_channel/io.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../util/util.dart';
import '../protobuf/koi.pb.dart';
import '../protobuf/decode_protobuf.dart';
import 'en_decode.dart';
import 'ws_state.dart';
// 导出变量
export 'ws_state.dart';

// A text message will be of type String and a binary message will be of type List<int>.
// Websocket 发送和接收只有两种类型：文本字符串或者二进制 List<int>
/*
websocket 工作流程：
连接，主动发送消息，服务器推送消息
连接状态：未连接，连接中，已连接
检测连接：发送 ping，服务器累计 3 次没有 pong，客户端则判
断连接断开（也有可能网络太慢，作断开处理）
连接断开：客户端尝试连接，连续失败，尝试+1，延时尝试连接时间+ x1
注意：状态变化，最好在UI层给用户展示，否则用户会感觉界面没有反应

onConnected: fn 已连接调用
onDisconnected: fn 断开连接调用

调用连接请求时，可能正在连接，发送心跳包如果有回应，说明已连接，没回应前，说明连接中

*/
class WebSocket extends EventEmitter {
  /// websocket 接口
  String wsUrl;

  /// 心跳包间隔（单位：秒），对于 dart 的 websocket，暂时不起作用，
  /// 目前只用来登录后的心跳包间隔
  Duration pingInterval;
  int intPingInterval;

  /// 发送超时（单位：秒）
  Duration timeout;

  /// 当前状态
  WSStatus currentStatus = WSStatus.disconnected;

  /// 累积次数
  int sendCount = 0,
      reconnectCount = 0,
      errorCount = 0,
      doneCount = 0,
      dataCount = 0,
      heartBeatCount = 0;

  /// websocket channel
  IOWebSocketChannel channel;

  /// 用于初始化 request id
  int random = Random().nextInt(100000);
  String timestamp = '${DateTime.now().millisecondsSinceEpoch}';

  HeartbeatReq _HeartbeatReq = HeartbeatReq();

  /// 心跳包定时句柄
  Timer heartBeatTimer;

  /// 延迟
  int heartBeatMilliseconds;
  DateTime lastHeartBeatTime;
  Timer lastHeartBeatTimer;
  Function heartBeatUnsubscription;

  StreamSubscription<dynamic> streamListener;

  /// 待请求队列
  Map<String, List<Function>> _queues = Map();
  Map<String, List<Function>> _logined_queues = Map();
  // Map<String, List<Function>> get queues => _queues;
  // Map<String, List<Function>> get logined_queues => _logined_queues;

  /// 发送途中，断开连接队列
  List<Function> _disconnectedCbs = List();
  List<Function> get disconnectedCbs => _disconnectedCbs;

  Function authCallback;
  bool isLogined = false;

  final StringUtil stringUtil = StringUtil();

  final StatusChangeWatcher statusChangeWatcher = StatusChangeWatcher();

  final Logger log = Logger('websocket');

  // 当前已经登录的 User
  User user;

  WebSocket(String wsUrl, int pingInterval, [int timeout = 20]) {
    this.wsUrl = wsUrl;
    this.intPingInterval = pingInterval;
    this.pingInterval = Duration(seconds: pingInterval);
    this.timeout = Duration(seconds: timeout);
    _init();
  }

  setUser(User _user) {
    user = _user;
  }

  /// 检查是否有连接
  checkWebsocketConnect() {
    if (lastHeartBeatTime == null) return log.info('init avoid check');
    if (currentStatus != WSStatus.disconnected) {
      var now = DateTime.now();
      var durationSeconds = now.difference(lastHeartBeatTime).inSeconds;
      // 登录后，每 [intPingInterval] 秒轮询一次, 如果超过 [intPingInterval+延迟+2秒]，这里当作已经断开
      // 没登录前，没有轮询，但是服务器会超过 300 秒主动断开连接
      var seconds = isLogined
          ? intPingInterval +
              (heartBeatMilliseconds != null
                  ? heartBeatMilliseconds / 1000
                  : 0) +
              2
          : 290;
      if (durationSeconds >= seconds) {
        lastHeartBeatTime = now;
        currentStatus = WSStatus.disconnected;
        log.info('checkWebsocketConnect: 心跳超时，需要提示连接断开，并重连');
        createWebsocket();
      }
    } else {
      currentStatus = WSStatus.disconnected;
      log.info('checkWebsocketConnect: 断开，重连：');
      createWebsocket();
    }
  }

  IOWebSocketChannel _init() {
    statusChangeWatcher.on(statusChangeWatcher.status_change, (result) {
      if (result == ConnectivityResult.wifi) {
        checkWebsocketConnect();
      } else if (result == ConnectivityResult.mobile) {
        checkWebsocketConnect();
      } else if (result == ConnectivityResult.none) {
        // 等待网络连接
      } else if (result == AppLifecycleState.paused) {
      } else if (result == AppLifecycleState.resumed) {
        checkWebsocketConnect();
      } else if (result == AppLifecycleState.inactive) {
      } else if (result == AppLifecycleState.suspending) {}
      // app 退到后台，停止心跳包；用户回到 app，开始心跳包；
      // 网络断开，停止心跳；网络连接，开始心跳；
      // 开始心跳时，如果不知道已经断开，如何重连？
    });
    return createWebsocket();
  }

  /// 创建连接
  IOWebSocketChannel createWebsocket(
      {bool is_reconnected = false, String method}) {
    lastHeartBeatTimer?.cancel();
    if (currentStatus != WSStatus.disconnected) {
      return channel;
    }
    if (!is_reconnected) {
      currentStatus = WSStatus.connecting;
      WSStatusData payload = WSStatusData(type: currentStatus);
      emit(WS_STATUS, payload);
    }
    isLogined = false;
    // 重连的时候关闭之前的连接
    if (channel != null) {
      closeChannel();
    }
    channel = IOWebSocketChannel.connect(wsUrl);
    streamListener = channel.stream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: false);
    reconnectCount++;
    log.info('ws:create websocket $reconnectCount');
    if (method != 'HEARTBEAT_REQ') {
      this.heartBeat();
    }
    return channel;
  }

  /// 登录后，定时发送心跳包，也用来检测网络是否连接上
  void heartBeat([Function cb]) {
    heartBeatCount++;
    final stopwatch = Stopwatch()..start();
    lastHeartBeatTime = DateTime.now();
    if (cb != null) {
      authCallback = () {
        _executeLoginedQueues();
        cb();
      };
    }
    // 发送之前，弄个定时，如果超时没返回，说明断开
    lastHeartBeatTimer?.cancel();
    lastHeartBeatTimer = Timer(
        Duration(
            milliseconds: 6000 +
                (heartBeatMilliseconds == null ? 4000 : heartBeatMilliseconds)),
        () {
      print('心跳超时，可能已经断开或网络非常慢');
      currentStatus = WSStatus.disconnected;
      createWebsocket();
    });
    if (heartBeatUnsubscription != null) {
      heartBeatUnsubscription();
      heartBeatUnsubscription = null;
    }
    heartBeatUnsubscription = send(
        method: 'HeartbeatReq',
        protobuf: _HeartbeatReq,
        cb: (data) {
          lastHeartBeatTime = DateTime.now();
          heartBeatMilliseconds = stopwatch.elapsed.inMilliseconds;
          emit(WS_HEARTBEAT_DELAY, {
            'date': DateTime.now(),
            'ms': heartBeatMilliseconds,
            'count': heartBeatCount
          });
          stopwatch.stop();
          startHeartBeats();
          // 服务器返回消息
          if (data.resType == 'server') {
            lastHeartBeatTimer?.cancel();
            if (authCallback != null && data.code != B00006) {
              print('execute auth callback');
              authCallback();
              authCallback = null;
            }

            if (currentStatus != WSStatus.connected) {
              currentStatus = WSStatus.connected;
              _executeQueues();
              WSStatusData payload = WSStatusData(
                  type: WSStatus.connected, data: data, count: dataCount);
              emit(WS_STATUS, payload);
              log.info('Execute queues：${_queues.length}');
            }
          } else {
            // 超时或者本地报错，停止心跳包
            stopHeartBeat();
          }
        });
  }

  /// 触发开始同步信息
  void emitUpdating() {
    WSStatusData payload = WSStatusData(type: WSStatus.updating);
    emit(WS_STATUS, payload);
  }

  /// 触发同步完成信息
  void emitConnected() {
    WSStatusData payload = WSStatusData(
        type: currentStatus == WSStatus.updating
            ? WSStatus.connected
            : currentStatus);
    emit(WS_STATUS, payload);
  }

  /// 循环发送心跳
  void startHeartBeats() {
    stopHeartBeat();
    heartBeatTimer = Timer(pingInterval, () {
      heartBeat();
    });
  }

  void stopHeartBeat() {
    heartBeatTimer?.cancel();
  }

  /// 登录后设置  sessionID
  void setSSID(sessionID, _user) {
    setUser(_user);
    isLogined = true;
    setHeaderSSID(sessionID);
    heartBeat(() {
      emitUpdating();
    });
  }

  /// 清空
  void clear() {
    log.info('clear ws');
    closeChannel();
    stopHeartBeat();
    stringUtil.clear();
    clearQueues();
    statusChangeWatcher?.clear();
  }

  /// 退出登录
  void logout() {
    stopHeartBeat();
    clearQueues();
    closeChannel();
    isLogined = false;
    currentStatus = WSStatus.disconnected;
    emit(LOGOUT);
  }

  void closeChannel() {
    setHeaderSSID(BigInt.from(10));
    streamListener?.cancel();
    channel.sink?.close(status.goingAway);
  }

  BigInt genRequestID() {
    String rid = '${timestamp}${random++}';
    return BigInt.parse(rid);
  }

  /// 发送请求
  /// 返回清除方法，通过执行可以清除
  Function send(
      {String method,
      dynamic protobuf,
      Map data,
      WebsocketCallback cb,
      // requestID: 通过  $WS.getRequestID() 生成，参数可选
      BigInt requestID,
      // 是否需要没网络时，返回
      bool delay = false,
      // 如果没有网络，是否放到队列中
      bool queue = false,
      // 是否需要登录
      bool auth = true,
      // 用于同一个方法但是多个请求
      dynamic queueID = 0,
      // 是��需要超时，如果是文件上传，这���需要设置为 false
      bool hasTimeout = true,
      // 是否响应回调
      bool hasResponse = true}) {
    method = stringUtil.getConstantCase(text: method);
    sendCount++;
    // 用时间戳和随机数作为 RequestID
    BigInt rid = requestID is BigInt ? requestID : genRequestID();
    String eventName = getEventName(rid);
    String _queueID = '${method}_${queueID}';
    Uint8List dataBuf;

    if (data != null) {
      mergeProtobufField(data, protobuf);
    }
    Timer timeoutTimer;
    Function disconnectedFn;

    void unsubscripe() {
      (!auth ? _queues : _logined_queues).remove(_queueID);
      timeoutTimer?.cancel();
      _disconnectedCbs.remove(disconnectedFn);
      off(eventName);
    }

    // 发送途中，掉线处理
    disconnectedFn = () {
      log.info('Execute disconnectedFn $method');
      unsubscripe();
      if (cb is Function) {
        cb(WebsocketCallbackData(
          type: 'disconnected',
          hasError: true,
          resMethod: '$method:disconnected',
          res: 'disconnected',
        ));
      }
    };

    // 需要放入队列的不需要 disconnected 回调，比如���天信息
    if (!queue) {
      _disconnectedCbs.add(disconnectedFn);
    }

    // 执行
    void fn() {
      log.info('ws:send data $method; count $sendCount');
      try {
        dataBuf = encodeData(method, protobuf.writeToBuffer(), rid);
        channel.sink.add(dataBuf);
      } catch (e) {
        _disconnectedCbs.add(disconnectedFn);
        if (cb is Function) {
          return cb(WebsocketCallbackData(
            hasError: true,
            resMethod: method,
            res: 'encode data fail: $e',
          ));
        }
        return;
      }

      if (hasResponse) {
        // 如果有响应
        if (hasTimeout) {
          // 使用超时，移除 event
          timeoutTimer = Timer(timeout, () {
            unsubscripe();
            cb(WebsocketCallbackData(
              type: 'timeout',
              hasError: true,
              resMethod: '$method:HAS_TIMEOUT',
              res: 'timeout',
            ));
          });
        }

        off(eventName);
        once(eventName, (payload) {
          unsubscripe();
          // 收到消息
          cb(WebsocketCallbackData(
              resType: payload['resType'],
              hasError: payload['hasError'],
              resMethod: payload['resMethod'],
              res: payload['res']));
        });
      }
    }

    // 加入队列函数
    void queueFn() {
      // 同一个请求方法，会发多次不同 ID 的请求查询数据
      if (!queue) {
        if ((!auth ? _queues : _logined_queues)[_queueID] != null &&
            (!auth ? _queues : _logined_queues)[_queueID].isNotEmpty) {
          (!auth ? _queues : _logined_queues).remove(_queueID);
        }
      }
      final List queueContainer = (!auth ? _queues : _logined_queues)
          .putIfAbsent(_queueID, () => List<Function>());
      queueContainer.add(fn);
      // 没网络。等待网络连接自动发送
      if (delay) {
        if (cb is Function) {
          cb(WebsocketCallbackData(
            type: 'delay', // ���示待发送，@Todo: 如果待发送之前将信息删掉，那么待发送需要从队列中移除
            hasError: true,
            resMethod: method,
            res: 'disconnected',
          ));
        }
      }
    }

    // 没连接的情况下，主动连接
    if (currentStatus == WSStatus.disconnected) {
      queueFn();
      createWebsocket(method: method);
    } else {
      fn();
      checkWebsocketConnect();
    }

    return unsubscripe;
  }

  /// 执行队列
  void _executeQueues() {
    if (currentStatus == WSStatus.connected) {
      _queues.forEach((k, v) {
        _queues.remove(v);
        for (var handler in v) {
          handler();
        }
        log.info('_queues remove $v');
      });
    } else {
      //
    }
  }

  // 执行登录后队列，bug：消息发送是有一定顺序的，而这个是同时异步发，没有顺序
  // todo，如果是有顺序的，放在一个新的顺序 queues 里面
  void _executeLoginedQueues() {
    _logined_queues.forEach((k, v) {
      _logined_queues.remove(v);
      for (var handler in v) {
        handler();
      }
      log.info('_logined_queues remove $v');
    });
  }

  /// 清除队列
  void clearQueues() {
    _queues.clear();
    _logined_queues.clear();
    _disconnectedCbs.clear();
  }

  /// Get event name
  String getEventName(rid) {
    return 'e-$rid';
  }

  /// 监听消息并处理
  void _onData(data) {
    dataCount++;
    var decodedData, response = {}, Data;
    String eventName = WS_SEND_ERROR, resMethod, resType = 'server';
    int RequestID;

    bool hasError = false;
    try {
      // 解码数据
      decodedData = decodeData(data);
      RequestID = decodedData['RequestID'];
      eventName = getEventName(RequestID);
    } catch (e) {
      hasError = true;
      Data = 'Decode data fail: $e';
      log.info('ws: $Data');
    }
    if (!hasError) {
      try {
        // 解码 protobuf 数据
        response = decodeProtobuf(decodedData);
        hasError = resMethod == 'SIG_ERROR';
        resMethod = response['Method'];
        Data = response['Data'];
        try {
          // 如果��有错误，Data 就没有 code 这个属性，会报错
          hasError = Data.code != '0';
        } catch (e) {
          //
        }
      } catch (e) {
        hasError = true;
        Data = 'Decode protobuf fail: $e';
        log.info('ws: $Data');
      }
    }

    if (RequestID != null && RequestID == 0) {
      eventName = WS_RECEIVE_STATE_UPDATE;
    }

    var result = {
      'resType': resType,
      'hasError': hasError,
      'resMethod': resMethod,
    };
    if (hasError) {
      try {
        result.addAll({
          'code': Data?.code,
        });
        if (Data?.code == B00006) {
          emit(B00006);
        }
      } catch (e) {
        //
      }
      result.addAll({'res': 'resMethod ${resMethod}; $Data'});
    } else {
      result.addAll({'res': Data});
    }
    emit(eventName, result);
  }

  /// 监听错误
  void _onError([error, StackTrace stackTrace]) {
    log.warning('_onError error: $error; StackTrace $stackTrace');
  }

  /// 监听连接断开
  void _onDone() {
    if (currentStatus != WSStatus.disconnected) {
      isLogined = false;
      currentStatus = WSStatus.disconnected;
      doneCount++;
      // 停止心跳
      stopHeartBeat();
      WSStatusData payload =
          WSStatusData(type: WSStatus.disconnected, count: doneCount, data: 1);
      emit(WS_STATUS, payload);
      log.info('Websocket disconnected: $doneCount');
    }
  }
}
