import 'package:flutter/material.dart';

import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:fixnum/fixnum.dart';

class ChatUnreadBadge extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;

  ChatUnreadBadge({Key key, @required this.icon, this.size, this.color})
      : super(key: key);

  _UnreadBadgeState createState() => _UnreadBadgeState();
}

class _UnreadBadgeState extends State<ChatUnreadBadge> {
  Int64 count;
  Function unreadCountSupscription;

  @override
  void initState() {
    super.initState();
    setState(() {
      count = $CH.getAllUnreadCount();
    });

    unreadCountSupscription = $WS.on(CHEvent.GET_ALL_CHAT_UNREAD, (payload) {
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
    var children = <Widget>[
      Icon(
        widget.icon,
        size: widget.size,
        color: widget?.color,
      )
    ];
    if (count > 0) {
      children.add(Positioned(
        right: -0.0,
        top: -0.0,
        child: Container(
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
              fontSize: 9,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ));
    }
    return Stack(children: children);
  }
}
