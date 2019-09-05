import 'package:elk_chat/protocol/api_util/api_util.dart';

import 'package:elk_chat/pages/chat_content/queue_msg.dart';
import 'package:elk_chat/theme_cupertino.dart';
import 'package:elk_chat/utils/cache.dart';
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
    /** 缓存头像，减少开销 */
    Widget avatar = GetCacheAvatar(msg.senderName);
    Widget bubble = Container(
      child: Row(
        mainAxisAlignment: isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          ContentWidgetByType(
            isRead: isSelf ? isRead : null, 
            msg: msg, 
            isSelf: isSelf,
            status: isSelf ? status : null,
            textColor: isSelf ? Themes.myBubbleTextColor : Colors.black87,
            dateFormat: dateFormat
          )
        ],
      )
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
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
  final Color textColor;
  final bool isSelf;

  const ContentWidgetByType({
    Key key, this.msg, this.isRead, this.status,
    this.dateFormat,
    this.isSelf,
    this.textColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> msgWidget = [];
    var dtime = msg.actionTime.toInt() * 1000;
    Widget timeTip = Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
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
              msg.message,
              style: TextStyle(
                color: textColor,
              ),
            ),
          )
        ];
        if(isRead != null) {
          txtMsgGroup.add(
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(
                isRead ? Icons.done_all : Icons.done,
                // MaterialCommunityIcons.getIconData(isRead ? 'done_all' : 'done'),
                size: 12.0,
              ),
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
        msgWidget.add(
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.65
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: isSelf ? Themes.myBubbleColor : Colors.white,
            ),
            child: txtMsg
          ));
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
