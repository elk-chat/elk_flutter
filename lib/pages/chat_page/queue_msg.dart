// queue msg model
import 'package:elk_chat/protocol/api_util/api_util.dart';
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
  Int64 fileID;
  String filePath;
  int messageType;
  int contentType;
  String message;
  String senderName;
  int actionTime;
  QueueMsg({
    @required this.status,
    @required this.chatID,
    @required this.messageType,
    @required this.contentType,
    @required this.message,
    @required this.actionTime,
    this.fileID,
    this.filePath
  });

  QueueMsg.fromMap(Map<String, dynamic> map) {
    status = map['status'];
    chatID = map['chatID'];
    messageType = map['messageType'];
    contentType = map['contentType'];
    message = map['message'];
    senderName = map['senderName'];
    actionTime = DateTime.now().millisecondsSinceEpoch;

    if (contentType != ChatContentType.Text &&
        contentType != ChatContentType.Geo) {
      fileID = map['fileID'];
      filePath = map['filePath'];
    }
  }
}
