import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/protocol/api/proto_helper.dart';
import 'package:elk_chat/screens/chat_list/unread_badge.dart';
import 'package:elk_chat/screens/screens.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:intl/intl.dart';

import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/repositorys/repositorys.dart';

// 缓存聊天成员
// todo 放到全局，并缓存到本地数据库
Map<Int64, List<User>> ChatMembersCache = {};

// 缓存最后消息
// todo 放到全局，并缓存到本地数据库
Map<Int64, List<StateUpdate>> StateUpdatesCache = {};

// todo 添加订阅发布，目前的只有显示，如果新消息到达或者发布新消息，这里不会有变化
// todo ChatHub 本地消息缓存与分发
// 聊天列表单项
class ChatItem extends StatefulWidget {
  final Chat chat;
  final ChatRepository chatRepository;
  final AuthAuthenticated authState;

  ChatItem(
      {Key key,
      @required this.chat,
      @required this.chatRepository,
      @required this.authState})
      : super(key: key);

  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  final DateFormat dateFormat = DateFormat('MM/dd HH:mm');
  List<User> members = [];
  Map chatInfo = {'title': '', 'avatarFileID': Int64(0)};
  List<dynamic> lastMessages = [];

  Function unSupscription;

  @override
  void initState() {
    super.initState();
    // 获取未读，上层获取

    var chatID = widget.chat.chatID;
    var lastMsgs = $CH.getLastMsg(chatID);
    setState(() {
      lastMessages = lastMsgs;
    });

    // 获取成员，（单人聊天标题），先从缓存中取
    var users = ChatMembersCache[chatID];
    if (users != null) {
      setState(() {
        members = users;
        chatInfo = getChatInfo(users);
      });
    } else {
      getMembers();
    }

    // 监听新消息/发送消息
    unSupscription = $WS.on(CHEvent.ALL_MSG(chatID), (res) {
      
      StateUpdatesCache[chatID] = [res];
      setState(() {
        lastMessages = [res];
      });
    });
  }

  @override
  void dispose() {
    unSupscription();
    super.dispose();
  }

  Map getChatInfo(List<User> members) {
    Map info = {};

    if (widget.chat.chatType == 2) {
      // 如果是单对单聊天
      for (var i in members) {
        if (i.userID != widget.authState.account.user.userID) {
          info = {
            'avatarFileID': i.avatarFileID,
            'title': i.userName,
          };
          break;
        }
      }
    } else {
      info = {
        'avatarFileID': widget.chat.avatarFileID,
        'title': widget.chat.title,
      };
    }
    return info;
  }

  // 获取聊天成员
  getMembers() async {
    List<User> users;
    try {
      users = await widget.chatRepository.getChatMembers(widget.chat);
      ChatMembersCache[widget.chat.chatID] = users;
      if (mounted) {
        setState(() {
          members = users;
          chatInfo = getChatInfo(users);
        });
      }
    } catch (e) {
      print('${widget.chat.chatID} error $e');
    }
  }

  // 获取消息
  // getMessages() async {
  //   try {
  //     var chatID = widget.chat.chatID;
  //     // 获取最后一条消息
  //     var res = await widget.chatRepository.getMsgHistory(0, 1, chatID, [1, 2]);
  //     StateUpdatesCache[chatID] = res.stateUpdates;
  //     if (mounted) {
  //       setState(() {
  //         lastMessages = res.stateUpdates;
  //       });
  //     }
  //   } catch (e) {
  //     print('getMessages error $e');
  //   }
  // }

  // 获取消息类型
  String getMessageText(UpdateMessage message) {
    var text = '';
    if (message.hasUpdateMessageChatAddMember()) {
      text = '${message.updateMessageChatAddMember.addedMemeberName} 加入群聊';
    } else if (message.hasUpdateMessageChatDeleteMember()) {
      text = '${message.updateMessageChatAddMember.addedMemeberName} 退出群聊';
    } else if (message.hasUpdateMessageChatDeleteMessage()) {
      text = '${message.updateMessageChatDeleteMessage.senderName} 删了一条消息';
    } else if (message.hasUpdateMessageChatReadMessage()) {
      text = '${message.updateMessageChatReadMessage.senderName} 已读';
    } else if (message.hasUpdateMessageChatSendMessage()) {
      text =
          '${message.updateMessageChatSendMessage.chatMessage.senderName}: ${message.updateMessageChatSendMessage.chatMessage.message}';
    } else if (message.hasUpdateMessageChatSetTyping()) {
      text = '${message.updateMessageChatSetTyping.senderName} 正在输入..';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    var chat = widget.chat;
    var lastMsg =
        lastMessages.length == 0 ? null : lastMessages[lastMessages.length - 1];
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ChatWindowScreen(
                      title: Text(chatInfo['title']),
                      chat: widget.chat,
                      chatRepository: widget.chatRepository,
                      authState: widget.authState,
                    )));
      },
      leading: Img(
          key: ValueKey(chatInfo['avatarFileID']),
          type: chat.chatType,
          fileID: chatInfo['avatarFileID'],
          title: chatInfo['title'],
          width: 48.0,
          height: 48.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            chatInfo['title'],
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
          Row(
            children: <Widget>[
              UnreadBadge(
                chatID: widget.chat.chatID,
              ),
              SizedBox(width: 8.0),
              Text(
                dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
                    (lastMsg == null ? chat.updatedAt : lastMsg.actionTime)
                            .toInt() *
                        1000)),
                style: const TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            ],
          )
        ],
      ),
      subtitle: Container(
        padding: const EdgeInsets.only(top: 6.0),
        // 最好一条消息，不同类型
        child: lastMessages.length == 0
            ? null
            : Text(
                getMessageText(lastMsg.updateMessage),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
                style: const TextStyle(color: Colors.black45, fontSize: 14.0),
              ),
      ),
    );
  }
}
