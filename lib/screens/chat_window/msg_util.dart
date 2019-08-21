import 'package:bubble/bubble.dart';
import 'package:elk_chat/protocol/api/state.dart';
import 'package:elk_chat/screens/chat_window/queue_msg.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MsgUtil {
  // 根据消息类型返回消息
  static Widget getMsgContentByType(dynamic msg,
      [bool isRead, QueueMsgStatus status]) {
    Widget tmp;
    switch (msg.contentType) {
      case ChatContentType.Text:
        tmp = Text(
            '${msg.message}  ${isRead == null ? '' : isRead ? '已读' : '未读'} ${status != null ? status == QueueMsgStatus.loading ? '正在发送' : '发送失败' : ''}',
            textAlign: TextAlign.right);
        break;
      case ChatContentType.Image:
        tmp = Img(fileID: msg.fileID, width: 100.0, height: 100.0, type: 3);
        break;
      default:
        tmp = Text('unprocess type ${msg.contentType}',
            textAlign: TextAlign.right);
    }
    return tmp;
  }

  // 生成发送消息组件
  static Widget getSendMsgWidget(
      int dtime, dynamic dateFormat, bool isSelf, bool isReaded, dynamic msg,
      [QueueMsgStatus status]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Bubble(
          alignment: Alignment.center,
          color: Color.fromRGBO(212, 234, 244, 1.0),
          child: Text(
              dateFormat.format(DateTime.fromMillisecondsSinceEpoch(dtime)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.0)),
        ),
        isSelf
            ? Bubble(
                margin: const BubbleEdges.only(top: 10),
                alignment: Alignment.topRight,
                nip: BubbleNip.rightTop,
                color: Color.fromRGBO(225, 255, 199, 1.0),
                child: MsgUtil.getMsgContentByType(msg, isReaded, status))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(child: Text(msg.senderName)),
                  Bubble(
                    margin: const BubbleEdges.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    nip: BubbleNip.leftTop,
                    child: Text('${msg.message}'),
                  )
                ],
              ),
      ],
    );
  }

  static DateFormat(String s) {}
}
