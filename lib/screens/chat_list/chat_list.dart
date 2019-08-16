import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/chat_hub/const.dart';
import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/util/util.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../repositorys/repositorys.dart';
import 'chat_item.dart';
import '../new_chat/new_chat.dart';

class ChatListScreen extends StatefulWidget {
  final title;
  final ChatRepository chatRepository;
  final AuthAuthenticated authState;

  ChatListScreen(
      {Key key,
      @required this.title,
      @required this.chatRepository,
      @required this.authState})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatListScreen>
    with AutomaticKeepAliveClientMixin<ChatListScreen> {
  final _scrollController = ScrollController();
  ChatBloc _chatBloc;
  ChatLoaded _chatState;

  @override
  void initState() {
    super.initState();

    _chatBloc = BlocProvider.of<ChatBloc>(context);

    $WS.on(CHEvent.SORT_CHATS_BY_LAST_MSG, (payload) {
      print('last msgs ${payload.length}');
      if (_chatState is ChatLoaded) {
        var chats = [];
        // if (payload[0].chatID == _chatState.chats[0].chatID) {
        //   print('顺序未变，避免排序');
        //   return;
        // }
        print(
            '_chatState.chats legnth ${_chatState.chats.length}; payload legnth ${payload.length};');
        for (var i in payload) {
          for (var j in _chatState.chats) {
            if (i.chatID == j.chatID) {
              chats.add(j);
              break;
            }
          }
        }

        _chatBloc.dispatch(SortChatList(chats: chats));
      }
    });
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
                      builder: (BuildContext context) => NewChatScreen(
                            title: '新聊天',
                            chatRepository: widget.chatRepository,
                            authState: widget.authState,
                          )));
            },
          ),
        ],
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        bloc: _chatBloc,
        builder: (context, state) {
          if (state is ChatLoaded) {
            _chatState = state;
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
                return EDivider();
              },
            );
          }
          return Center(
            child: CupertinoActivityIndicator(
              radius: 10,
            ),
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
