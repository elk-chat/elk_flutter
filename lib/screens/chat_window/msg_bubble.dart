import 'package:bubble/bubble.dart';
import 'package:elk_chat/protocol/api/state.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MsgBubble extends StatefulWidget {
  final StateUpdate stateUpdate;
  final bool isSelf;
  final String userName;

  MsgBubble(
      {Key key,
      @required this.stateUpdate,
      @required this.isSelf,
      this.userName})
      : super(key: key);

  _MsgBubbleState createState() => _MsgBubbleState();
}

class _MsgBubbleState extends State<MsgBubble> {
  final DateFormat dateFormat = DateFormat('MM/dd HH:mm');

  Widget getMsgContentByType(UpdateMessageChatSendMessage msg) {
    Widget tmp;
    switch (msg.contentType) {
      case ChatContentType.Text:
        tmp = Text(msg.message, textAlign: TextAlign.right);
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

  @override
  Widget build(BuildContext context) {
    var state = widget.stateUpdate;
    var updMsg = state.updateMessage;
    if (state.messageType == ChatMessageType.AddMember) {
      // 加入群聊
      return Container(
          child: Row(
        children: <Widget>[
          widget.userName != null &&
                  updMsg.updateMessageChatAddMember.addedMemeberName ==
                      widget.userName
              ? Text('你', style: TextStyle(color: Colors.black87))
              : Text(updMsg.updateMessageChatAddMember.addedMemeberName,
                  style: TextStyle(color: Colors.blue)),
          Text(' 加入群聊', style: TextStyle(color: Colors.black38)),
        ],
      ));
    } else if (state.messageType == ChatMessageType.SendMessage) {
      // 发送消息：ChatContentType 文本/图片/文件/视频/音频/地理位置
      var msg = updMsg.updateMessageChatSendMessage;
      var dtime = dateFormat.format(
          DateTime.fromMillisecondsSinceEpoch(msg.actionTime.toInt() * 1000));
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Bubble(
            alignment: Alignment.center,
            color: Color.fromRGBO(212, 234, 244, 1.0),
            child: Text(dtime,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
          ),
          widget.isSelf
              ? Bubble(
                  margin: const BubbleEdges.only(top: 10),
                  alignment: Alignment.topRight,
                  nip: BubbleNip.rightTop,
                  color: Color.fromRGBO(225, 255, 199, 1.0),
                  child: getMsgContentByType(msg),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(child: Text(msg.senderName)),
                    Bubble(
                      margin: const BubbleEdges.only(top: 5.0),
                      alignment: Alignment.topLeft,
                      nip: BubbleNip.leftTop,
                      child: Text(msg.message),
                    )
                  ],
                ),
        ],
      );
    }
    return Container(child: Text('未知消息类型 ${state.messageType}'));
  }
}
