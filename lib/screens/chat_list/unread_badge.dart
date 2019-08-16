import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

class UnreadBadge extends StatefulWidget {
  final Int64 chatID;

  UnreadBadge({Key key, @required this.chatID}) : super(key: key);

  _UnreadBadgeState createState() => _UnreadBadgeState();
}

class _UnreadBadgeState extends State<UnreadBadge> {
  Int64 count;
  Function unreadCountSupscription;

  @override
  void initState() {
    super.initState();
    setState(() {
      count = $CH.getUnreadCount(widget.chatID);
    });

    unreadCountSupscription =
        $WS.on(CHEvent.INIT_CHAT_UNREAD(widget.chatID), (payload) {
      setState(() {
        count = payload;
      });
    });
  }

  @override
  void dispose() {
    unreadCountSupscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return SizedBox();
    return Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints(
          minWidth: 14,
          minHeight: 14,
        ),
        child: Text(
          '$count',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      );
  }
}
