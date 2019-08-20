// 发起群聊

import 'package:elk_chat/widgets/widgets.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/repositorys/repositorys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NewGroupChatCreateScreen extends StatefulWidget {
  final String title;
  final ChatRepository chatRepository;
  final AuthAuthenticated authState;
  final List members;

  NewGroupChatCreateScreen(
      {Key key,
      @required this.title,
      @required this.members,
      @required this.chatRepository,
      @required this.authState})
      : super(key: key);

  _NewGroupChatState createState() => _NewGroupChatState();
}

class _NewGroupChatState extends State<NewGroupChatCreateScreen> {
  TextEditingController _controller = TextEditingController();
  String text = '';
  ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _chatBloc = BlocProvider.of<ChatBloc>(context);
  }

  handleCreateChat() async {
    try {
      var res = await widget.chatRepository.create(text);
      // res.chat.title = widget.title;
      // res.chat.avatarFileID = widget.avatarFileID;
      print('res.chat ${res.chat}');
      _chatBloc.dispatch(AddChat(chat: res.chat));
      widget.chatRepository.addMembers(widget.members, res.chat.chatID);
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } catch (e) {
      print('创建群聊失败：$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title}'),
          centerTitle: true,
          actions: <Widget>[
            CupertinoButton(
              child: Text('创建', style: const TextStyle(fontSize: 15.0)),
              onPressed: text.isNotEmpty ? handleCreateChat : null,
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Img(
                                type: 1,
                                fileID: Int64(0),
                                width: 64.0,
                                height: 64.0)),
                        Container(
                            child: Flexible(
                                child: TextField(
                          autofocus: true,
                          controller: _controller,
                          onChanged: (value) {
                            setState(() {
                              text = value.trim();
                            });
                          },
                          textInputAction: TextInputAction.go,
                          // style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              hintText: "群名称",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    MaterialCommunityIcons.getIconData(
                                        'close-circle'),
                                    color: Colors.black38,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      text = '';
                                    });
                                    WidgetsBinding.instance
                                        .addPostFrameCallback(
                                            (_) => _controller.clear());
                                  })),
                        ))),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 90.0),
                      decoration: BoxDecoration(
                        border: Border(
                            top: const BorderSide(
                                color: Colors.black12, width: 0.5)),
                      ),
                    ),
                    Container(
                        child: CupertinoButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0),
                      child:
                          Text('设置封面', style: const TextStyle(fontSize: 15.0)),
                      onPressed: () {
                        //
                      },
                    )),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: const BorderSide(
                                color: Colors.black12, width: 0.5)),
                      ),
                    )
                  ],
                )),
                Container(
                    width: double.infinity,
                    child: Text('成员 (${widget.members.length})',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    color: const Color(0xffeeeeee)),
                Flexible(
                    child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var contact = widget.members[index];

                    return ContactWidget(
                        avatarSize: 40.0, contact: contact, onTap: null);
                  },
                  itemCount: widget.members.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return EDivider(indent: 60);
                  },
                )),
              ],
            )
          ],
        ));
  }
}
