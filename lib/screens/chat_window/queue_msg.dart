// queue msg model
import 'package:meta/meta.dart';

/*
class Todo {
  int id;
  String title;
  bool done;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Todo();

  Todo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    done = map[columnDone] == 1;
  }
}
*/
/*
        'status': 'init', // 状态 init / loading / error
        'chatID': _chat.chatID,
        'messageType': ChatMessageType.SendMessage,
        'contentType': ChatContentType.Text,
        'message': text,
        'actionTime': DateTime.now().millisecondsSinceEpoch
*/
import 'package:fixnum/fixnum.dart';

enum QueueMsgStatus { init, loading, error }

class QueueMsg {
  QueueMsgStatus status;
  Int64 chatID;
  int messageType;
  int contentType;
  String message;
  int actionTime;
  QueueMsg({
    @required this.status,
    @required this.chatID,
    @required this.messageType,
    @required this.contentType,
    @required this.message,
    @required this.actionTime,
  });

  QueueMsg.fromMap(Map<String, dynamic> map) {
    status = map['status'];
    chatID = map['chatID'];
    messageType = map['messageType'];
    contentType = map['contentType'];
    message = map['message'];
    actionTime = map['actionTime'];
  }
}
