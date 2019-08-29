import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/pages/new_chat/new_group_select_users.dart';
import 'package:elk_chat/protocol/util/util.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'chat_item.dart';
import '../new_chat/new_chat.dart';

class ChatListPage extends StatefulWidget {
  final title;

  ChatListPage({Key key, @required this.title}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatListPage> {
  final _scrollController = ScrollController();
  ChatBloc _chatBloc;
  Function unsubscription;

  @override
  void initState() {
    super.initState();

    _chatBloc = BlocProvider.of<ChatBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        heroTag: 'ChatList',
        transitionBetweenRoutes: false,
        middle: widget.title,
        // heroTag: 'ChatList',
        leading: Text(''),
        // centerTitle: true,
        trailing: Container(
          child: GestureDetector(
            child: Icon(
              MaterialCommunityIcons.getIconData('playlist-plus'),
            ),
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (BuildContext context) => NewGroupChatSelectUsersPage(
                    title: '新建群聊',
                  )
                )
              );
            },
          )
        )
      ),
      child: BlocBuilder<ChatBloc, ChatState>(
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
                return ChatItem(key: ValueKey(chat.chatID), chat: chat);
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
