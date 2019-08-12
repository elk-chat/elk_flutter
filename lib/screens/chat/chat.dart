import 'package:elk_chat/blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../repositorys/repositorys.dart';
import 'chat_item.dart';
import '../new_chat.dart';

class ChatScreen extends StatefulWidget {
  final title;
  final ChatRepository chatRepository;
  final AuthAuthenticated authState;

  ChatScreen(
      {Key key,
      @required this.title,
      @required this.chatRepository,
      @required this.authState})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin<ChatScreen> {
  final _scrollController = ScrollController();
  ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();

    _chatBloc = BlocProvider.of<ChatBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              MaterialCommunityIcons.getIconData('playlist-plus'),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) =>
                          NewChatScreen(title: '新聊天')));
            },
          ),
        ],
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        bloc: _chatBloc,
        builder: (context, state) {
          if (state is ChatLoaded) {
            if (state.chats.isEmpty) {
              return Center(
                child: Text('no chats'),
              );
            }
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var chat = state.chats[index];
                return ChatItem(
                    key: ValueKey(chat.chatID),
                    chat: chat,
                    authState: widget.authState,
                    chatRepository: widget.chatRepository);
              },
              itemCount: state.chats.length,
              controller: _scrollController,
              separatorBuilder: (context, index) {
                return Divider(height: 0);
              },
            );
          }
          return Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
