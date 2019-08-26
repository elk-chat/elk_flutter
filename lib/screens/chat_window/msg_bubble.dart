import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api/chat.dart';
import 'package:elk_chat/protocol/api/state.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'msg_widget.dart';

class MsgBubble extends StatefulWidget {
  final Chat chat;
  final StateUpdate stateUpdate;
  final bool isSelf;
  final String userName;
  final Function getStateRead;
  final Function setOwnStateRead;
  final DateFormat dateFormat;

  MsgBubble(
      {Key key,
      @required this.chat,
      @required this.stateUpdate,
      @required this.dateFormat,
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

  // 别人读到的 state，用于已读/未读
  getStateRead() {
    var state = widget.getStateRead();
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
          print("标为已读失败 $data");
        } else {
          if (mounted) {
            //  未读清空，有 bug：目前直接清零，本来应该是，读到哪条就减少多少未读数
            Int64 zero = Int64(0);
            $CH.unreadMap[widget.stateUpdate.chatID] = zero;
            $WS.emit(CHEvent.INIT_CHAT_UNREAD(widget.stateUpdate.chatID), zero);
            $WS.emit(CHEvent.GET_ALL_CHAT_UNREAD, $CH.getAllUnreadCount());
          }
          print('已标为已读');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getStateRead();

    var state = widget.stateUpdate;
    var updMsg = state.updateMessage;
    var isAdminDid = widget.chat.creatorID == state.senderID;
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
          Text(
              isAdminDid
                  // ? ' 被${updMsg.updateMessageChatAddMember.senderName}邀请入群'
                  ? ' 进入群聊'
                  : ' 加入群聊',
              style: TextStyle(color: Colors.black38)),
        ],
      ));
    } else if (state.messageType == ChatMessageType.DeleteMember) {
      // 加入群聊
      return Container(
          child: Row(
        children: <Widget>[
          widget.userName != null &&
                  updMsg.updateMessageChatDeleteMember.deletedMemeberName ==
                      widget.userName
              ? Text('你', style: TextStyle(color: Colors.black87))
              : Text(updMsg.updateMessageChatDeleteMember.deletedMemeberName,
                  style: TextStyle(color: Colors.blue)),
          Text(
              isAdminDid
                  // ? '被${updMsg.updateMessageChatDeleteMember.senderName}移出群聊'
                  ? ' 被移出群聊'
                  : ' 退出群聊',
              style: TextStyle(color: Colors.black38)),
        ],
      ));
    } else if (state.messageType == ChatMessageType.SendMessage) {
      // 发送消息：ChatContentType 文本/图片/文件/视频/音频/地理位置
      var msg = updMsg.updateMessageChatSendMessage.chatMessage;

      return MsgWidget(
          key: ValueKey(msg.actionTime),
          dtime: msg.actionTime.toInt() * 1000,
          dateFormat: dateFormat,
          isSelf: widget.isSelf,
          isRead: stateRead >= widget.stateUpdate.state,
          msg: msg);
    }
    return Container(child: Text('未知消息类型 messageType： ${state.messageType}'));
  }
}
