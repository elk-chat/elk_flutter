import 'dart:typed_data';
import '../protobuf/sig_mapper.dart';

/// 公用头
var COMMON_HEADER = {
  "Len": 0,
  "Sig": 0,
  "ApplicationID": 1,
  "AuthKeyID": BigInt.from(10),
  "SessionID": BigInt.from(10),
  "RequestID": BigInt.from(10),
  "ResponseID": BigInt.from(10)
};

/// 字节长度
Map<String, num> HeaderByteLen = {
  "Len": 4,
  "Sig": 4,
  "ApplicationID": 4,
  "AuthKeyID": 8,
  "SessionID": 8,
  "RequestID": 8,
  "ResponseID": 8
};

/// 头部总长度
var headerBufferLength =
    HeaderByteLen.values.reduce((sum, element) => sum + element);

/// 字节偏移
var HBYTEOFFSET_LEN = 0;
var HBYTEOFFSET_SIG = HeaderByteLen['Len'] + HBYTEOFFSET_LEN;
var HBYTEOFFSET_APP_ID = HeaderByteLen['ApplicationID'] + HBYTEOFFSET_SIG;
var HBYTEOFFSET_AUTHKEYID = HeaderByteLen['Sig'] + HBYTEOFFSET_APP_ID;
var HBYTEOFFSET_SESSIONID = HeaderByteLen['AuthKeyID'] + HBYTEOFFSET_AUTHKEYID;
var HBYTEOFFSET_REQUESTID = HeaderByteLen['SessionID'] + HBYTEOFFSET_SESSIONID;
var HBYTEOFFSET_RESPONSEID = HeaderByteLen['RequestID'] + HBYTEOFFSET_REQUESTID;

Endian little = Endian.little;

/// 设置会话信息
void setHeaderSSID(sessionID) {
  COMMON_HEADER['SessionID'] = sessionID;
}

/// 获取 Sig
num getSig(String method) {
  var sig = SigMapper['SIG_${method.toUpperCase()}'];
  assert(sig != null);
  return sig;
}

/** 
 * 发送前编码数据
 * ```
 * - 'method' 请求方法
 * - 'protobufData' 发送的 protobuf 数据
 * - 'requestID' 请求ID，当返回的请求ID和发出去的请求ID一样的时候，表示该请求已经完成
 * ```
 */
Uint8List encodeData(String method, Uint8List protobufData, BigInt requestID) {
  int totalLength = headerBufferLength + protobufData.lengthInBytes;
  var header = Map.from(COMMON_HEADER);
  header.addAll(
      {'Len': totalLength, 'Sig': getSig(method), 'RequestID': requestID});

  ByteData byteData = ByteData(totalLength);

  byteData.setUint32(HBYTEOFFSET_LEN, header['Len'], little);
  byteData.setUint32(HBYTEOFFSET_SIG, header['Sig'], little);
  byteData.setUint32(HBYTEOFFSET_APP_ID, header['ApplicationID'], little);
  byteData.setUint64(
      HBYTEOFFSET_AUTHKEYID, header['AuthKeyID'].toInt(), little);
  byteData.setUint64(
      HBYTEOFFSET_SESSIONID, header['SessionID'].toInt(), little);
  byteData.setUint64(
      HBYTEOFFSET_REQUESTID, header['RequestID'].toInt(), little);
  byteData.setUint64(
      HBYTEOFFSET_RESPONSEID, header['ResponseID'].toInt(), little);

  header.clear();

  Uint8List dataBuffer = byteData.buffer.asUint8List();
  dataBuffer.setAll(headerBufferLength, protobufData);
  return dataBuffer;
}

/** 
 * 解码服务端返回的数据
 * 收到后解码，这里不用 buffer，是因为 webscoket 默认返回的就是 Uint8List
 * ```
 * 'response' 服务端返回数据
 * ```
 */
Map<String, dynamic> decodeData(Uint8List response) {
  ByteData byteData = response.buffer.asByteData();
  // 一样的东西，转化后，长度不一样，很奇怪，这里做下兼容
  // [1, 2, 3] -> [3, 4, 1, 2, 3] 前面多两个字节
  int offset = byteData.lengthInBytes - response.length;
  Map<String, dynamic> headerBufMapper = {
    'Len': byteData.getUint32(HBYTEOFFSET_LEN + offset, little),
    'Sig': byteData.getUint32(HBYTEOFFSET_SIG + offset, little),
    'ApplicationID': byteData.getUint32(HBYTEOFFSET_APP_ID + offset, little),
    'AuthKeyID': byteData.getUint64(HBYTEOFFSET_AUTHKEYID + offset, little),
    'SessionID': byteData.getUint64(HBYTEOFFSET_SESSIONID + offset, little),
    'RequestID': byteData.getUint64(HBYTEOFFSET_REQUESTID + offset, little),
    'ResponseID': byteData.getUint64(HBYTEOFFSET_RESPONSEID + offset, little),
  };
  var dataBuf = response.getRange(headerBufferLength, response.length);
  headerBufMapper['DataBuf'] = Uint8List.fromList(dataBuf.toList());
  return headerBufMapper;
}
