import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/protocol/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'msg_bubble.dart';

class ChatMsgRender extends StatelessWidget {
  final onTap;
  final controller;
  final bool loading;
  final chatMsgs;
  final chat;
  final user;
  final stateRead;

  ChatMsgRender({
    Key key,
    this.onTap,
    this.controller,
    this.loading,
    this.chatMsgs,
    this.chat,
    this.user,
    this.stateRead,
  }) : super(key: key);

  static final DateTime today = DateTime.now();
  static final int nowTime = today.millisecondsSinceEpoch;
  // static final DateTime _today = DateTime.fromMicrosecondsSinceEpoch(nowTime);
  static final int oneDayHours = 86400000;
  static final int nowTimeMillSec = (nowTime / 1000).toInt();
  static final int timeDisplayDelay = 300;

  String timeFilter(time) {
    var _time = (time * 1000).toInt();
    var currTimeDate = DateTime.fromMillisecondsSinceEpoch(_time);
    // var dayOffset = currTimeDate.difference(_today).inDays;
    var dateTimestampDiff = nowTime - _time;
    DateFormat dateFormat = DateFormat.Hm();
    String prefix = '';
    if (dateTimestampDiff < oneDayHours) {
      prefix = '今天';
    } else if (dateTimestampDiff < oneDayHours * 2) {
      prefix = '昨天';
    } else if (dateTimestampDiff < oneDayHours * 3) {
      prefix = '前天';
    } else if (dateTimestampDiff >= oneDayHours * 3) {
      dateFormat = DateFormat('y-MM-d H:mm');
    }
    return (prefix.isNotEmpty ? (prefix + ' ') : '') + dateFormat.format(currTimeDate);
  }

  @override
  Widget build(BuildContext context) {
    int msgsLength = chatMsgs.length;
    int allMsgsLength = msgsLength + (loading ? 1 : 0);
    
    // 时间提示
    int prevTime = 0;
    print('prevTime ${prevTime}');

    return Flexible(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          itemCount: allMsgsLength,
          reverse: true,
          controller: controller,
          itemBuilder: (context, index) {
            if (loading && index == msgsLength) {
              return CupertinoActivityIndicator(
                radius: 10,
              );
            }
            StateUpdate stateUpdate = chatMsgs[index];
            bool isRead = stateRead >= stateUpdate.state;

            Widget bubble = MsgBubble(
              key: ValueKey(stateUpdate.messageID),
              chat: chat,
              // dateFormat: dateFormat,
              // getStateRead: () => _stateRead,
              // setOwnStateRead: (stateRead) {
              //   _stateRead.ownStateRead = stateRead;
              // },
              userName: user.userName,
              isRead: isRead,
              isSelf: stateUpdate.senderID == user.userID,
              stateUpdate: stateUpdate,
            );

            Widget timeElem;

            var actionTime = stateUpdate.actionTime.toInt();
            
            bool timeout = prevTime == 0 || prevTime - actionTime > timeDisplayDelay;
            // bool timeout = true;
            if (timeout) {
              timeElem = Center(
                child: Text(
                  timeFilter(actionTime),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff999999)
                  ),
                ),
              );
              prevTime = actionTime;
            }

            return timeout ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: timeElem,
                ),
                Container(
                  child: bubble,
                ),
              ],
            ) : bubble;
          },
        )
      ),
    );
  }
}
