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
  final String userName;
  final QueueMsgStatus status;

  const MsgWidget({
    Key key,
    this.dateFormat,
    this.userName,
    this.isSelf,
    this.dtime,
    this.msg,
    this.status,
    this.isRead
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Img(
      height: 26.0,
      width: 26.0,
      // fileID: msg.avatarFileID,
      title: msg.senderName,
      type: 3,
    );
    Widget bubble = Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7
      ),
      child: Bubble(
        margin: const BubbleEdges.only(top: 10),
        alignment: isSelf ? Alignment.topRight : Alignment.topLeft,
        nip: isSelf ? BubbleNip.rightTop : BubbleNip.leftTop,
        color: isSelf ? Color(0xffE1ECF4) : Colors.white,
        child: ContentWidgetByType(
          isRead: isSelf ? isRead : null, 
          msg: msg, 
          status: isSelf ? status : null,
          dateFormat: dateFormat
        )
      ),
    );
    Widget offset = SizedBox(width: 8.0);
    List <Widget> msgItem = isSelf ? [
      bubble,
      offset,
      avatar,
    ] : [
      avatar,
      offset,
      bubble,
    ];
    return Column(
      crossAxisAlignment: isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: msgItem,
          ),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> msgWidget = [];
    var dtime = msg.actionTime.toInt() * 1000;
    Widget timeTip = Container(
      child: Text(
        // dateFormat.format(DateTime.fromMillisecondsSinceEpoch(dtime)),
        dateFormat.format(DateTime.fromMillisecondsSinceEpoch(dtime)),
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black38,
          fontSize: 12.0
        ),
      ),
    );
    switch (msg.contentType) {
      case ChatContentType.Text:
        List<Widget> txtMsgGroup = [
          Flexible(
            child: Text(
              '${msg.message} ${status != null ? status == QueueMsgStatus.loading ? '正在发送' : '发送失败' : ''}',
            ),
          )
        ];
        if(isRead != null) {
          txtMsgGroup.add(
            Icon(
              isRead ? Icons.done_all : Icons.done,
              // MaterialCommunityIcons.getIconData(isRead ? 'done_all' : 'done'),
              size: 12.0,
            )
          );
        }
        txtMsgGroup.add(timeTip);
        Widget txtMsg = (
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: txtMsgGroup,
          )
        );
        msgWidget.add(txtMsg);
        break;
      case ChatContentType.Image:
        msgWidget.add(
          Img(
            fileID: msg.fileID,
            width: 100.0,
            height: 100.0,
            type: 3,
            hasTap: true,
          )
        );
        break;
      default:
        msgWidget.add(
          Text(
            'unprocess type ${msg.contentType}',
            textAlign: TextAlign.right
          )
        );
    }
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: msgWidget
    );
  }
}
