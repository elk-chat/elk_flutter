import 'package:bubble/bubble.dart';
import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api/chat.dart';
import 'package:elk_chat/protocol/api/state.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/flushbar.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MsgBubble extends StatefulWidget {
  final StateUpdate stateUpdate;
  final bool isSelf;
  final String userName;
  final Function getStateRead;
  final Function setOwnStateRead;

  MsgBubble(
      {Key key,
      @required this.stateUpdate,
      @required this.isSelf,
      @required this.getStateRead,
      @required this.setOwnStateRead,
      this.userName})
      : super(key: key);

  _MsgBubbleState createState() => _MsgBubbleState();
}

class _MsgBubbleState extends State<MsgBubble> {
  final DateFormat dateFormat = DateFormat('MM/dd HH:mm');
  Int64 stateRead;
  Int64 ownStateRead;
  Function unsubscription;

  getStateRead() {
    var state = widget.getStateRead();
    // 别人读到的 state，用于已读/未读
    stateRead = state.stateRead;
    ownStateRead = state.ownStateRead;
  }

  @override
  void initState() {
    super.initState();
    // 标未已读
    getStateRead();
    // 自己读到的 state，消息类型为发送的消息，并且没有发送过的
    if ((widget.stateUpdate.messageType == ChatMessageType.SendMessage) &&
        !widget.isSelf &&
        ownStateRead < widget.stateUpdate.state) {
      ChatReadMessageReq _ChatReadMessageReq = ChatReadMessageReq();
      _ChatReadMessageReq.chatID = widget.stateUpdate.chatID;
      _ChatReadMessageReq.stateRead = widget.stateUpdate.state;
      widget.setOwnStateRead(widget.stateUpdate.state);
      readMsg(_ChatReadMessageReq, (data) {
        if (data.hasError) {
          showFlushBar('标记为已读失败 ${data.res}', context);
        } else {
          if (mounted) {
            //  未读清空，有bug，目前将就处理
            Int64 zero = Int64(0);
            $CH.unreadMap[widget.stateUpdate.chatID] = zero;
            $WS.emit(CHEvent.INIT_CHAT_UNREAD(widget.stateUpdate.chatID), zero);
          }
          print('已标为已读');
        }
      });
    }
    if (widget.isSelf) {
      // 监听该消息已读未读
    }
    print(
        'msg bubble ownStateRead ${ownStateRead} 消息state ：${widget.stateUpdate.state}');
  }

  Widget getMsgContentByType(UpdateMessageChatSendMessage msg) {
    Widget tmp;
    switch (msg.contentType) {
      case ChatContentType.Text:
        tmp = Text(
            '${msg.message}  [${stateRead}-${widget.stateUpdate.state}] ${stateRead >= widget.stateUpdate.state ? '已读' : '未读'}',
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

  @override
  Widget build(BuildContext context) {
    getStateRead();

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
                      child:
                          Text('${msg.message} [${widget.stateUpdate.state}]'),
                    )
                  ],
                ),
        ],
      );
    }
    return Container(child: Text('未知消息类型 ${state.messageType}'));
  }
}
