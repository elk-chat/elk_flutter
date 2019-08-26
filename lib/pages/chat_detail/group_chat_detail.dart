import 'package:elk_chat/blocs/chat/chat.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api_util/api_util.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/pages/chat_detail/select_users.dart';
import 'package:elk_chat/pages/contact_detail.dart';
import 'package:elk_chat/pages/new_chat/group_info_edit.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 查看附件
// 查看群成员
// 群成员邀请/分享群链接
class GroupChatDetailPage extends StatefulWidget {
  final String title;
  final Int64 avatarFileID;
  final Chat chat;
  final Function updateParentChat;

  GroupChatDetailPage({
    Key key,
    @required this.title,
    @required this.avatarFileID,
    @required this.chat,
    @required this.updateParentChat,
  }) : super(key: key);

  @override
  _GroupChatDetailState createState() => _GroupChatDetailState();
}

class _GroupChatDetailState extends State<GroupChatDetailPage> {
  ChatBloc _chatBloc;

  bool isEdit;
  List<User> _members;

  TextEditingController _controller;
  String text;
  int avaterSize = 256;
  bool uploading = false;
  Int64 avatarFileID;

  @override
  void initState() {
    super.initState();

    isEdit = false;
    _members = [];

    _chatBloc = BlocProvider.of<ChatBloc>(context);
    text = widget.chat.title;
    _controller = TextEditingController(text: widget.chat.title);
    avatarFileID = widget.chat.avatarFileID;
    _getMembers();
  }

  _getMembers() async {
    try {
      var members = await getChatMembers(widget.chat);
      if (mounted) {
        setState(() {
          _members = members;
        });
      }
    } catch (e) {
      showError('获取群成员列表失败 $e');
    }
  }

  showError(String error) {
    print(error);

    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  onDone() async {
    bool hasUpdate =
        widget.chat.avatarFileID != avatarFileID || widget.chat.title != text;
    if (isEdit && hasUpdate) {
      try {
        await $CH.chatApi
            .updateProfile(widget.chat.chatID, text, avatarFileID);
        Chat chat = widget.chat.clone();
        chat.avatarFileID = avatarFileID;
        chat.title = text;
        widget.updateParentChat(chat);
        _chatBloc.dispatch(UpdateChat(chat: chat));
      } catch (e) {
        showError(e);
      }
    }
    setState(() {
      isEdit = !isEdit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(text),
          centerTitle: true,
          actions: <Widget>[
            CupertinoButton(
              // color: Colors.greenAccent,
              child: Text(isEdit ? '完成' : '编辑',
                  style: const TextStyle(fontSize: 15.0)),
              onPressed: text.isNotEmpty &&
                      !uploading &&
                      $CH.user.userID == widget.chat.creatorID
                  ? onDone
                  : null,
            ),
          ],
        ),
        body: CupertinoScrollbar(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _members.length + 2,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        isEdit
                            ? GroupInfoEdit(
                                avatarFileID: avatarFileID,
                                controller: _controller,
                                uploading: uploading,
                                context: context,
                                setText: (value) {
                                  setState(() {
                                    text = value;
                                  });
                                },
                                setUploading: () {
                                  if (mounted) {
                                    setState(() {
                                      uploading = true;
                                    });
                                  }
                                },
                                setFinish: (_avatarFileID) {
                                  if (mounted) {
                                    setState(() {
                                      avatarFileID = _avatarFileID;
                                      uploading = false;
                                    });
                                  }
                                },
                              )
                            : (ListTile(
                                leading: Container(
                                    child: Img(
                                        fileID: avatarFileID,
                                        title: text,
                                        width: 48.0,
                                        height: 48.0,
                                        type: ChatType.Group)),
                                title: Text(text))),
                        SizedBox(
                          height: 12,
                        ),
                        CupertinoButton(
                          // color: Colors.greenAccent,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add),
                              Text('添加成员',
                                  style: const TextStyle(fontSize: 15.0))
                            ],
                          ),
                          onPressed: $CH.user.userID == widget.chat.creatorID
                              ? onAddMembers
                              : null,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                            child: Text('群成员（${_members.length}）',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black54)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            color: const Color(0xffeeeeee)),
                      ],
                    );
                  } else if (index == _members.length + 1) {
                    return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            child: CupertinoButton(
                                color: Colors.red,
                                onPressed: onConfirmDeleteChat,
                                child: Text('退出群聊',
                                    style: TextStyle(color: Colors.white)))));
                  }
                  var user = _members[index - 1];
                  // 暂时没有创建人 creatorID
                  // user.userID == widget.chat.creatorID
                  var isAdmin = user.userID == widget.chat.creatorID;
                  var isSelf = user.userID == $CH.user.userID;
                  var _user = User();
                  _user.userName =
                      '${isSelf ? '${user.userName}（自己）' : user.userName} ${isAdmin ? '（管理员）' : ''}';
                  _user.userID = user.userID;
                  _user.avatarFileID = user.avatarFileID;

                  return ContactWidget(
                      key: ValueKey(user.userID),
                      hasCheckbox: false,
                      checked: false,
                      avatarSize: 36.0,
                      user: _user,
                      onTap: isSelf
                          ? null
                          : () {
                              onConfirmDeleteMember(user);
                            });
                })));
  }

  onAddMembers() async {
    var selectUsers = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SelectUsersPage(
            title: '选择成员',
          ),
        ));
    $CH.chatApi.addMembers(selectUsers, widget.chat.chatID);
    Navigator.pop(context);
  }

  // 是否移除群成员（只要管理员可以）
  onConfirmDeleteMember(User user) {
    showCupertinoModalPopup(
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text(user.userName),
            // message: Text('描述'),
            actions: <Widget>[
              widget.chat.creatorID == $CH.user.userID
                  ? CupertinoActionSheetAction(
                      child: Text('移出群聊',
                          style: TextStyle(fontSize: 16, color: Colors.red)),
                      onPressed: () {
                        _deleteMember(user);
                      },
                    )
                  : Container(),
              CupertinoActionSheetAction(
                child: Text('查看资料', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProfilePage(
                              title: user.userName,
                              contact: user,
                              isAtContact: false)));
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        context: context);
  }

  _deleteMember(User user) {
    Navigator.pop(context);

    ChatDeleteMemberReq _ChatDeleteMemberReq = ChatDeleteMemberReq();
    _ChatDeleteMemberReq.chatID = widget.chat.chatID;
    _ChatDeleteMemberReq.userID = user.userID;
    deleteMember(_ChatDeleteMemberReq, (data) {
      if (data.hasError) {
        showError('移除群成员失败 ${data.res}');
      } else {
        if (mounted) {
          setState(() {
            _members = _members.where((i) => i.userID != user.userID).toList();
          });
        }
      }
    });
  }

  // 是否退��群聊
  onConfirmDeleteChat() {
    showCupertinoModalPopup(
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('将清空聊天记录'),
            // message: Text('描述'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('确定退出',
                    style: TextStyle(fontSize: 16, color: Colors.red)),
                onPressed: _deleteChat,
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        context: context);
  }

  _deleteChat() {
    // 服务端暂时没有这个接口，现在只是从客户端删掉
    _chatBloc.dispatch(DeleteChat(chat: widget.chat));
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
