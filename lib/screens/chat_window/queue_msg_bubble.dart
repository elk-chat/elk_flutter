// 待发送消息

import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/protocol/api/state.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/repositorys/repositorys.dart';
import 'package:elk_chat/widgets/img.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'queue_msg.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class QueueMsgBubble extends StatefulWidget {
  final ChatRepository chatRepository;
  final QueueMsg queueMsg;
  final DateFormat dateFormat;
  final Function remove;

  QueueMsgBubble(
      {Key key,
      @required this.chatRepository,
      @required this.remove,
      @required this.queueMsg,
      @required this.dateFormat})
      : super(key: key);

  _QueueMsgBubbleState createState() => _QueueMsgBubbleState();
}

class _QueueMsgBubbleState extends State<QueueMsgBubble> {
  QueueMsg queueMsg;
  ChatRepository chatRepository;

  QueueMsgStatus status;
  List<int> bytes;

  @override
  void initState() {
    super.initState();

    queueMsg = widget.queueMsg;
    chatRepository = widget.chatRepository;
    status = queueMsg.status;
    if (status == QueueMsgStatus.init) {
      switch (queueMsg.contentType) {
        case ChatContentType.Text:
          sendMsg(queueMsg.message);
          break;
        case ChatContentType.Geo:
          print('发送地理位置');
          break;
        default:
          sendFile(queueMsg.filePath, queueMsg.contentType);
          print('发送文件');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  sendMsg(String message, [Int64 fileID]) async {
    if (status != QueueMsgStatus.loading) {
      setState(() {
        status = QueueMsgStatus.loading;
      });
    }
    try {
      var res = await chatRepository.sendMsg(
          queueMsg.chatID, queueMsg.contentType, message, fileID);

      widget.remove();
      print(res);
    } catch (e) {
      setState(() {
        status = QueueMsgStatus.error;
      });
      print('发送失败 $e');
    }
  }

  readFileBytesFromPath(path) async {
    var file = await File(path);
    var bytes = await file.readAsBytes();
    return bytes;
  }

  // 获取图片宽高
  getImageInfo(List<int> fileBytes) async {
    var decodedImage = await decodeImageFromList(fileBytes);
    return decodedImage;
    // decodedImage.dispose();
    // print(decodedImage.width);
    // print(decodedImage.height);
  }

  // 发送文件：图片/视频/文件等。。。
  sendFile(String filePath, int contentType) async {
    bytes = await readFileBytesFromPath(filePath);
    UtilityUploadReq _UtilityUploadReq = UtilityUploadReq();
    _UtilityUploadReq.chatID = queueMsg.chatID;
    _UtilityUploadReq.data = bytes;
    _UtilityUploadReq.fileName = filePath.split('/').last;
    _UtilityUploadReq.contentType = contentType;

    if (contentType == ChatContentType.Image) {
      var imageInfo = await getImageInfo(bytes);
      _UtilityUploadReq.width = imageInfo.width;
      _UtilityUploadReq.height = imageInfo.height;
      imageInfo.dispose();
      setState(() {});
      // _UtilityUploadReq.caption = 'caption';
    }
    uploadFile(_UtilityUploadReq, (data) async {
      _UtilityUploadReq.clear();
      if (data.hasError) {
        print('上传文件错误 ${data.res}');
      } else {
        // DfsFile;
        print('上传成功 ${data.res.file}');
        sendMsg('', data.res.file.fileID);
        // 缓存图片
        await DefaultCacheManager().putFile(data.res.file.uRL, bytes);
        bytes = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Bubble(
          alignment: Alignment.center,
          color: Color.fromRGBO(212, 234, 244, 1.0),
          child: Text(
              widget.dateFormat.format(
                  DateTime.fromMillisecondsSinceEpoch(queueMsg.actionTime)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.0)),
        ),
        Bubble(
            margin: const BubbleEdges.only(top: 10),
            alignment: Alignment.topRight,
            nip: BubbleNip.rightTop,
            color: Color.fromRGBO(225, 255, 199, 1.0),
            child: buildMsgContentByType(queueMsg)),
      ],
    );
  }

  Widget buildMsgContentByType(QueueMsg queueMsg) {
    Widget widget;

    switch (queueMsg.contentType) {
      case ChatContentType.Text:
        widget = Text(
            '${queueMsg.message}  ${status == QueueMsgStatus.loading ? '正在发送' : '发送失败'}',
            textAlign: TextAlign.right);
        break;
      case ChatContentType.Image:
        if (queueMsg.fileID == null) {
          widget = bytes != null
              ? Image.memory(bytes, width: 100.0, height: 100.0)
              : Container(
                  child: Text('加载图片..'),
                );
        } else {
          widget = Img(
              key: ValueKey(queueMsg.fileID),
              fileID: queueMsg.fileID,
              width: 100.0,
              height: 100.0,
              type: 3);
        }
        break;
      case ChatContentType.Video:
        widget = Text('视频', textAlign: TextAlign.right);
        break;
      default:
        widget = Text('unprocess type ${queueMsg.contentType}',
            textAlign: TextAlign.right);
    }

    return widget;
  }
}
