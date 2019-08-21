// 待发送消息

import 'package:elk_chat/repositorys/repositorys.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'msg_util.dart';
import 'queue_msg.dart';

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

  @override
  void initState() {
    super.initState();

    queueMsg = widget.queueMsg;
    chatRepository = widget.chatRepository;

    status = queueMsg.status;
    if (status == QueueMsgStatus.init) {
      sendMsg();
    }
  }

  sendMsg() async {
    try {
      var res = await chatRepository.sendMsg(
          queueMsg.chatID, queueMsg.contentType, queueMsg.message);
      widget.remove();
      print(res);
    } catch (e) {
      setState(() {
        status = QueueMsgStatus.error;
      });
      print('发送失败 $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MsgUtil.getSendMsgWidget(
        queueMsg.actionTime, widget.dateFormat, true, null, queueMsg, status);
  }
}
