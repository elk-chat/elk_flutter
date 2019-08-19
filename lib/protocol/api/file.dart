/// 文件相关接口

import '../network/websocket.dart';
import 'package:elk_chat/init_websocket.dart';
import '../protobuf/koi.pb.dart';

/// 上传文件
uploadFile(UtilityUploadReq proto, WebsocketCallback cb,
    [UtilityUploadResp resp]) {
  return $WS.send(method: "UtilityUploadReq", protobuf: proto, cb: cb);
}

/// 获取文件信息
getFileState(UtilityFileStatReq proto, WebsocketCallback cb,
    [UtilityFileStatResp resp]) {
  return $WS.send(method: "UtilityFileStatReq", protobuf: proto, cb: cb);
}

/// 下载文件
downloadFile(UtilityDownloadReq proto, WebsocketCallback cb,
    [UtilityDownloadReq resp]) {
  return $WS.send(method: "UtilityDownloadReq", protobuf: proto, cb: cb);
}
