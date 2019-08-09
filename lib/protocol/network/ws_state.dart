/// 连接状态
enum WSStatus {
  /// 连接中
  connecting,

  /// 已连接
  connected,

  /// 更新中
  updating,

  /// 断开连接
  disconnected,
}

/**
 * websocket 回调数据结构
 * ```
 * {
 *   resType: String,    // server: 是服务器返回; 其他：本地错误返回
 *   hasError: bool,     // 是否有错误
 *   resMethod: String,  // 方法
 *   res: dynamic,       // 返回的数据
 *   type: String        // 错误类型，'delay': 等待网络连接再次发送；'timeout': 超时 
 * }
 * ```
 */
class WebsocketCallbackData {
  /// 返回类型：server: 表示服务器返回； null | '': 本地错误
  String resType;

  /// 有没有错误
  bool hasError;

  /// protobuf decode 方法
  String resMethod;

  /// 类型： delay: 表示需要延迟发送
  String type;

  /// 返回数据
  dynamic res;
  WebsocketCallbackData(
      {bool hasError,
      String type,
      String resMethod,
      dynamic res,
      String resType}) {
    this.hasError = hasError;
    this.resMethod = resMethod;
    this.res = res;
    this.type = type;
    this.resType = resType;
  }

  @override
  String toString() {
    return 'hasError: $hasError; resMethod: $resMethod; res: $res';
  }
}

/**
 * websocket 回调
 */
typedef WebsocketCallback = void Function(WebsocketCallbackData data);

/// 触发 WSStatus 事件带的数据
class WSStatusData {
  /// 当前状态
  WSStatus type;

  /// 次数
  int count;

  /// 错误
  dynamic error;

  /// 错误轨迹
  StackTrace stackTrace;

  /// 数据
  dynamic data;

  WSStatusData(
      {WSStatus type,
      int count,
      dynamic error,
      dynamic data,
      StackTrace stackTrace}) {
    this.type = type;
    this.data = data;
    this.count = count;
    this.stackTrace = stackTrace;
    this.error = error;
  }

  @override
  String toString() {
    return 'type: $type; data: $data; error: ${error.toString()}; stackTrace: ${stackTrace.toString()}';
  }
}

/// 连接状态发生改变触发事件
const String WS_STATUS = 'WS_STATUS_CHANGE';

/// 心跳包延迟
const String WS_HEARTBEAT_DELAY = 'HEARTBEAT_DELAY';

/// 发送有错误
const String WS_SEND_ERROR = 'SEND_HAS_ERROR';

/// 收到推送信息
const String WS_RECEIVE_STATE_UPDATE = 'RECEIVE_DATA';
