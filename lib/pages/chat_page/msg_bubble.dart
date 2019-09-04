import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api_util/api_util.dart';

import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'msg_widget.dart';

class MsgBubble extends StatelessWidget {
  final Chat chat;
  final StateUpdate stateUpdate;
  final bool isSelf;
  final String userName;
  final Function getStateRead;
  final bool isRead;
  // final Function setOwnStateRead;
  // final DateFormat dateFormat;

  MsgBubble({
    Key key,
    @required this.chat,
    @required this.stateUpdate,
    // @required this.dateFormat,
    @required this.isSelf,
    @required this.getStateRead,
    // @required this.setOwnStateRead,
    this.userName,
    this.isRead,
  }) : super(key: key);

//   _MsgBubbleState createState() => _MsgBubbleState();
// }

// class _MsgBubbleState extends State<MsgBubble> {
  final DateFormat dateFormat = DateFormat.Hm();
  Int64 stateRead;
  Int64 ownStateRead;
  Function unsubscription;

  // 别人读到的 state，用于已读/未读
  // getStateRead() {
  //   var state = widget.getStateRead();
  //   stateRead = state.stateRead;
  //   ownStateRead = state.ownStateRead;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // 标未已读
  //   // getStateRead();
  //   // 自己读到的 state，消息类型为发送的消息，并且没有发送过的
  //   // if (
  //   //   (widget.stateUpdate.messageType == ChatMessageType.SendMessage)
  //   //   && !widget.isSelf
  //   //   && ownStateRead < widget.stateUpdate.state
  //   // ) {
  //   //   ChatReadMessageReq chatReadMessageReq = ChatReadMessageReq();
  //   //   chatReadMessageReq.chatID = widget.stateUpdate.chatID;
  //   //   chatReadMessageReq.stateRead = widget.stateUpdate.state;
  //   //   // widget.setOwnStateRead(widget.stateUpdate.state);
  //   //   readMsg(chatReadMessageReq, (data) {
  //   //     if (data.hasError) {
  //   //       print("标为已读失败 $data");
  //   //     } else {
  //   //       if (mounted) {
  //   //         //  未读清空，有 bug：目前直接清零，本来应该是，读到哪条就减少多少未读数
  //   //         Int64 zero = Int64(0);
  //   //         $CH.unreadMap[widget.stateUpdate.chatID] = zero;
  //   //         $WS.emit(CHEvent.INIT_CHAT_UNREAD(widget.stateUpdate.chatID), zero);
  //   //         $WS.emit(CHEvent.GET_ALL_CHAT_UNREAD, $CH.getAllUnreadCount());
  //   //       }
  //   //       print('已标为已读');
  //   //     }
  //   //   });
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    // getStateRead();

    StateUpdate state = stateUpdate;
    UpdateMessage updMsg = state.updateMessage;
    bool isAdminDid = chat.creatorID == state.senderID;
    
    switch (state.messageType) {
      case ChatMessageType.AddMember:
        return Container(
          padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              userName != null &&
                      updMsg.updateMessageChatAddMember.addedMemeberName ==
                          userName
                  ? Text('你', style: TextStyle(color: Colors.black38))
                  : Text(updMsg.updateMessageChatAddMember.addedMemeberName,
                      style: TextStyle(color: Colors.blue)),
              Text(
                isAdminDid
                  // ? ' 被${updMsg.updateMessageChatAddMember.senderName}邀请入群'
                  ? ' 进入群聊'
                  : ' 加入群聊',
                style: TextStyle(color: Colors.black38)
              ),
            ],
          )
        );
      case ChatMessageType.DeleteMember:
        return Container(
          padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              userName != null && updMsg.updateMessageChatDeleteMember.deletedMemeberName == userName
                ? Text('你', style: TextStyle(color: Colors.black38))
                : Text(
                    updMsg.updateMessageChatDeleteMember.deletedMemeberName,
                    style: TextStyle(color: Colors.black38)
                  ),
              Text(
                isAdminDid
                  // ? '被${updMsg.updateMessageChatDeleteMember.senderName}移出群聊'
                  ? ' 被移出群聊'
                  : ' 退出群聊',
                style: TextStyle(color: Colors.black38)
              ),
            ],
          )
        );
      case ChatMessageType.SendMessage:
        ChatMessage msg = updMsg.updateMessageChatSendMessage.chatMessage;

        return MsgWidget(
          key: ValueKey(msg.actionTime),
          // dtime: msg.actionTime.toInt() * 1000,
          dateFormat: dateFormat,
          isSelf: isSelf,
          userName: userName,
          isRead: isRead,
          msg: msg
        );
      default:
        return Container(child: Text('未知消息类型 messageType： ${state.messageType}'));
    }
  }
}
