import 'dart:async';
import 'dart:typed_data';
import 'dart:math';
// 这里使用这个，而不是 dart:html Websocket，是因为 dart:html Websocket 是给浏览器用的，flutter 环境用不了。
import 'package:logging/logging.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../util/util.dart';
import '../protobuf/koi.pb.dart' as proto;
import '../protobuf/decode_protobuf.dart';
import 'en_decode.dart';
import 'ws_state.dart';
// 导出变量
export 'ws_state.dart';

// A text message will be of type String and a binary message will be of type List<int>.
// Websocket 发送和接收只有两种类型：文本字符串或者二进制 List<int>

class WebSocket extends EventEmitter {
  /// websocket 接口
  String wsUrl;

  /// 心跳包间隔（单位：秒）
  Duration pingInterval;

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
  WebSocketChannel channel;

  /// 用于初始化 rid
  int random = Random().nextInt(100000);
  String timestamp = '${DateTime.now().millisecondsSinceEpoch}';

  /// 心跳包定时句柄
  Timer heartBeatTimer;

  /// 延迟
  int heartBeatMilliseconds;
  DateTime lastHeartBeatTime;
  Timer heartbeatTimeoutTimer;

  /// 错误
  Timer onErrorTimer;

  StreamSubscription<dynamic> streamListener;

  /// 待请求队列
  Map<String, List<Function>> _queues = Map();
  Map<String, List<Function>> get queues => _queues;

  /// 发送途中，断开连接队列
  List<Function> _disconnectedCbs = List();
  List<Function> get disconnectedCbs => _disconnectedCbs;

  final StringUtil stringUtil = StringUtil();

  final StatusChangeWatcher statusChangeWatcher = StatusChangeWatcher();

  final Logger log = Logger('websocket');
  /** `
   * 初始化
   * ```
   * 'wsUrl': 链接
   * 'pingInterval': 心跳包间隔（单位：秒）
   * 'timeout': 请求超时，默认 20 秒 （单位：秒）
   * ```
   */
  WebSocket(String wsUrl, int pingInterval, [int timeout = 20]) {
    this.wsUrl = wsUrl;
    this.pingInterval = Duration(seconds: pingInterval);
    this.timeout = Duration(seconds: timeout);
    _init();
  }

  /// 检查是否有连接
  checkWebsocketConnect() {
    if (lastHeartBeatTime == null) return log.info('init avoid check');
    if (currentStatus != WSStatus.disconnected) {
      // 取消心跳检查定时
      heartbeatTimeoutTimer?.cancel();
      var now = DateTime.now();
      var durationSeconds = now.difference(lastHeartBeatTime).inSeconds;
      if (durationSeconds >= 299) {
        // 超过300秒，服务器主动断开，已经超时
        lastHeartBeatTime = now;
        currentStatus = WSStatus.disconnected;
        log.info('checkWebsocketConnect: 心跳超时，需要提示连接断开，并重连');
        createWebsocket();
      } else {
        log.info('checkWebsocketConnect: 连接正常');
      }
    } else {
      currentStatus = WSStatus.disconnected;
      log.info('checkWebsocketConnect: 连接断开，重连：');
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
    if (currentStatus != WSStatus.disconnected) {
      return channel;
    }
    if (!is_reconnected) {
      currentStatus = WSStatus.connecting;
      WSStatusData payload = WSStatusData(type: currentStatus);
      emit(WS_STATUS, payload);
    }

    // 重连的时候关闭之前的连接
    if (channel != null) {
      closeChannel();
    }
    channel = IOWebSocketChannel.connect(wsUrl);
    streamListener = channel.stream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
    reconnectCount++;
    log.info('ws:create websocket $reconnectCount');
    if (method != 'HEARTBEAT_REQ') {
      this.heartBeat();
    }
    return channel;
  }

  /// 登录后，定时发送心跳包，也用来检测网络是否连接上
  void heartBeat() {
    heartBeatCount++;
    final stopwatch = Stopwatch()..start();
    lastHeartBeatTime = DateTime.now();
    heartbeatTimeoutTimer?.cancel();
    if (currentStatus == WSStatus.connected) {
      // 如果是连接状态，才需要定时
      heartbeatTimeoutTimer = Timer(
          Duration(
              seconds: 5, // 允许误差在延迟的基础上再多 5 秒
              milliseconds: heartBeatMilliseconds != null
                  ? heartBeatMilliseconds
                  : 0), () {
        // 断线
        log.info('timeout maybe disconnected');
        _onError('timeout maybe disconnected');
      });
    }
    send(
        method: 'HeartbeatReq',
        protobuf: proto.HeartbeatReq(),
        cb: (data) {
          log.info(data);
          heartbeatTimeoutTimer?.cancel();
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
    WSStatusData payload = WSStatusData(type: WSStatus.connected);
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
    heartbeatTimeoutTimer?.cancel();
    heartBeatTimer?.cancel();
  }

  /// 登录后设置  sessionID
  void setSSID(sessionID) {
    setHeaderSSID(sessionID);
  }

  /// 清空
  void clear() {
    log.info('clear ws');
    closeChannel();
    stopHeartBeat();
    stringUtil.clear();
    _queues.clear();
    _disconnectedCbs.clear();
    statusChangeWatcher?.clear();
  }

  /// 退出登录
  void logout() {
    stopHeartBeat();
    setSSID(BigInt.from(10));
  }

  void closeChannel() {
    streamListener?.cancel();
    channel.sink?.close(status.goingAway);
  }

  BigInt genRequestID() {
    String rid = '${timestamp}${random++}';
    return BigInt.parse(rid);
  }

  /// 发送请求
  /// [TODO] 有些复杂，待重构
  void send(
      {String method,
      dynamic protobuf,
      Map data,
      WebsocketCallback cb,
      // requestId: 通过  $WS.getRequestID() 生成，参数可选
      BigInt requestId,
      // 如果没有网络，是否需要放到队列中
      bool queue = false,
      // 是��需要超时，如果是文件上传，这���需要设置为 false
      bool hasTimeout = true,
      // 是否响应回调
      bool hasResponse = true}) {
    method = stringUtil.getConstantCase(text: method);
    sendCount++;
    log.info('$sendCount ws:send data $method');
    // 用时间戳和随机数作为 RequestID
    BigInt rid = requestId is BigInt ? requestId : genRequestID();
    String eventName = 'e-$rid';
    Uint8List dataBuf;

    if (data != null) {
      mergeProtobufField(data, protobuf);
    }
    Timer timeoutTimer;

    // 发送途中，掉线处理
    disconnectedFn() {
      log.info('Execute disconnectedFn $method');
      _queues.remove(method);
      timeoutTimer?.cancel();
      cb(WebsocketCallbackData(
        type: 'disconnected',
        hasError: true,
        resMethod: '$method:disconnected',
        res: 'disconnected',
      ));
    }

    // 需要放入队列的不需要 disconnected 回调，比如���天信息
    if (!queue) {
      _disconnectedCbs.add(disconnectedFn);
    }

    // 执行
    void fn() {
      try {
        dataBuf = encodeData(method, protobuf.writeToBuffer(), rid);
        channel.sink.add(dataBuf);
      } catch (e) {
        _disconnectedCbs.add(disconnectedFn);
        return cb(WebsocketCallbackData(
          hasError: true,
          resMethod: method,
          res: 'encode data fail: $e',
        ));
      }

      if (hasResponse) {
        // 如果有响应
        if (hasTimeout) {
          // 使用超时，移除 event
          timeoutTimer = Timer(timeout, () {
            _queues.remove(method);
            _disconnectedCbs.remove(disconnectedFn);
            // 超时处理
            // ���果在���有返回的时候，��接断开，那么直接���发失败
            /*
              emit(eventName, {
                'type': 'timeout',
                'hasError': true,
                'resMethod': '$method:HAS_TIMEOUT',
                'res': 'timeout ${timeout}s'
              });
            */
            off(eventName);
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
          _queues.remove(method);
          _disconnectedCbs.remove(disconnectedFn);
          timeoutTimer?.cancel();
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
      if (!queue) {
        if (_queues[method] != null && _queues[method].isNotEmpty) {
          _queues.remove(method);
        }
      }
      final List queueContainer =
          _queues.putIfAbsent(method, () => List<Function>());
      queueContainer.add(fn);
      // 没网络。等待网络连接自动发送
      cb(WebsocketCallbackData(
        type: 'delay', // ���示待发送，@Todo: 如果待发送之前将信息删掉，那么待发送需要从队列中移除
        hasError: true,
        resMethod: method,
        res: 'disconnected',
      ));
    }

    // 没连接的情况下，主动连接，不需要放到队列中
    if (currentStatus == WSStatus.disconnected) {
      queueFn();
      createWebsocket(method: method);
    } else {
      fn();
      checkWebsocketConnect();
    }
  }

  /// 执行队列
  void _executeQueues() {
    if (currentStatus == WSStatus.connected) {
      _queues.forEach((k, v) {
        for (var handler in v) {
          handler();
        }
        log.info('_queues remove $v');
        _queues.remove(v);
      });
    } else {
      //
    }
  }

  /// 清除队列
  void clearQueues() {
    _queues.forEach((k, v) {
      _queues.remove(k);
    });
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
          // 如果没有错误，Data 就没有 code 这个属性，会报错
          hasError = Data.code != '0';
        } catch (e) {
          // 没有错误
        }
      } catch (e) {
        hasError = true;
        Data = 'Decode protobuf fail: $e';
        log.info('ws: $Data');
      }
    }
    // 收到数据不需要触发事件
    // WSStatusData payload =
    //     WSStatusData(type: WSStatus.data, data: response, count: dataCount);
    // emit(WS_STATUS, payload);

    if (RequestID != null && RequestID == 0) {
      eventName = WS_RECEIVE_STATE_UPDATE;
    }
    if (hasError && Data.code == 'B00006') {
      // emit(WS_STATUS, 'reLogin');
    }

    var result = {
      'resType': resType,
      'hasError': hasError,
      'resMethod': resMethod,
      'res': hasError && Data.message.isNotEmpty
          ? '${Data.code}:${Data.message}'
          : Data,
    };
    emit(eventName, result);
  }

  /// 监听错误
  void _onError([error, StackTrace stackTrace]) {
    heartbeatTimeoutTimer?.cancel();
    fn() {
      int i = 0;
      while (i <= _disconnectedCbs.length) {
        _disconnectedCbs.removeLast()();
        i++;
      }
    }

    // 如果已经是断线的情况下，那么
    if (currentStatus == WSStatus.disconnected) {
      fn();
    } else {
      onErrorTimer?.cancel();
      // 如果不是断线，6 秒后检查依然不是连接状态
      onErrorTimer = Timer(Duration(seconds: 6), () {
        if (currentStatus != WSStatus.connected) {
          fn();
        }
      });
    }

    errorCount++;
    currentStatus = WSStatus.disconnected;
    WSStatusData payload = WSStatusData(
        type: currentStatus,
        error: error,
        stackTrace: stackTrace,
        count: errorCount);
    emit(WS_STATUS, payload);
  }

  /// 监听连接断开
  void _onDone() {
    heartbeatTimeoutTimer?.cancel();
    if (currentStatus != WSStatus.disconnected) {
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
