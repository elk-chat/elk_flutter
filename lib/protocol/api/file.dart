/// 文件相关接口

import '../network/websocket.dart';
import 'package:elk_chat/init_websocket.dart';
import '../protobuf/koi.pb.dart' as proto;

/// 上传文件
uploadFile(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "UtilityUploadReq",
      protobuf: proto.UtilityUploadReq(),
      data: formData,
      cb: cb);
}

/// 获取文件信息
getFileState(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "UtilityFileStatReq",
      protobuf: proto.UtilityFileStatReq(),
      data: formData,
      cb: cb);
}

/// 下载文件
downloadFile(Map formData, WebsocketCallback cb) {
  return $WS.send(
      method: "UtilityDownloadReq",
      protobuf: proto.UtilityDownloadReq(),
      data: formData,
      cb: cb);
}
