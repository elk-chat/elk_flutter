import 'package:bubble/bubble.dart';
import 'package:elk_chat/protocol/api_util/api_util.dart';

import 'package:elk_chat/pages/chat_page/queue_msg.dart';
import 'package:elk_chat/widgets/img.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MsgWidget extends StatelessWidget {
  final DateFormat dateFormat;
  final bool isSelf;
  final int dtime;
  final dynamic msg;
  final dynamic isRead;
  final QueueMsgStatus status;

  const MsgWidget(
      {Key key,
      this.dateFormat,
      this.isSelf,
      this.dtime,
      this.msg,
      this.status,
      this.isRead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Bubble(
        //   alignment: Alignment.center,
        //   color: Color.fromRGBO(212, 234, 244, 1.0),
        //   child: Text(
        //     dateFormat.format(DateTime.fromMillisecondsSinceEpoch(dtime)),
        //     textAlign: TextAlign.center,
        //     style: TextStyle(fontSize: 11.0)
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: 
            isSelf
              ? Bubble(
                  margin: const BubbleEdges.only(top: 10),
                  alignment: Alignment.topRight,
                  nip: BubbleNip.rightTop,
                  color: Color.fromRGBO(225, 255, 199, 1.0),
                  child: ContentWidgetByType(
                    isRead: isRead, msg: msg, status: status,
                    dateFormat: dateFormat
                  )
                )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(child: Text(msg.senderName)),
                  Bubble(
                    margin: const BubbleEdges.only(top: 5.0),
                    alignment: Alignment.topLeft,
                    nip: BubbleNip.leftTop,
                    child: ContentWidgetByType(
                      isRead: null, msg: msg, status: null,
                      dateFormat: dateFormat
                    ),
                  )
                ],
              )
            )
      ],
    );
  }
}

class ContentWidgetByType extends StatelessWidget {
  final dynamic msg;
  final dynamic isRead;
  final QueueMsgStatus status;
  final DateFormat dateFormat;

  const ContentWidgetByType({
    Key key, this.msg, this.isRead, this.status,
    this.dateFormat
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tmp;
    var dtime = msg.actionTime.toInt() * 1000;
    switch (msg.contentType) {
      case ChatContentType.Text:
        tmp = Text(
          '${msg.message}  ${isRead == null ? '' : isRead ? '已读' : '未读'} ${status != null ? status == QueueMsgStatus.loading ? '正在发送' : '发送失败' : ''}',
          // textAlign: TextAlign.left
        );
        break;
      case ChatContentType.Image:
        tmp = Img(
          fileID: msg.fileID,
          width: 100.0,
          height: 100.0,
          type: 3,
          hasTap: true,
        );
        break;
      default:
        tmp = Text(
          'unprocess type ${msg.contentType}',
          textAlign: TextAlign.right
        );
    }
    return Column(children: <Widget>[
      tmp,
      Container(
        child: Text(
          dateFormat.format(DateTime.fromMillisecondsSinceEpoch(dtime)),
          style: TextStyle(
            color: Colors.black38,
            fontSize: 12.0
          ),
          textAlign: TextAlign.right
        ),
      )
    ];
  }
}
