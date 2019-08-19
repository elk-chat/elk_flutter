import 'package:elk_chat/widgets/chat_icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:elk_chat/repositorys/repositorys.dart';

import 'package:elk_chat/widgets/icon_badge.dart';
import 'package:elk_chat/blocs/blocs.dart';
import '../widgets/widgets.dart';
import 'chat_list/chat_list.dart';
import 'contact_list/contact_list.dart';
import 'more.dart';

class TabsScreen extends StatefulWidget {
  final AuthAuthenticated authState;
  final ContactRepository contactRepository;
  final ChatRepository chatRepository;

  TabsScreen(
      {Key key,
      @required this.authState,
      @required this.contactRepository,
      @required this.chatRepository})
      : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  PageController _pageController;
  int _page = 0;
  double _iconSize = 26.0;

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(
        icon: ChatUnreadBadge(
            size: _iconSize,
            icon: MaterialIcons.getIconData('chat-bubble-outline')),
        activeIcon: Icon(
          MaterialIcons.getIconData('chat-bubble'),
          size: _iconSize,
        ),
        title: Container(height: 0.0),
      ),
      BottomNavigationBarItem(
        icon: IconBadge(
            size: _iconSize,
            count: 0,
            icon: MaterialCommunityIcons.getIconData('account-box-outline')),
        activeIcon: Icon(
          MaterialCommunityIcons.getIconData('account-box'),
          size: _iconSize,
        ),
        title: Container(height: 0.0),
      ),
      BottomNavigationBarItem(
        icon: IconBadge(
            size: _iconSize,
            count: 0,
            icon: MaterialCommunityIcons.getIconData('settings-outline')),
        activeIcon: Icon(
          MaterialCommunityIcons.getIconData('settings'),
          size: _iconSize,
        ),
        title: Container(height: 0.0),
      ),
    ];
    final List<Widget> tabBodies = [
      ChatListScreen(
          title: Connection(title: '消息'),
          chatRepository: widget.chatRepository,
          authState: widget.authState),
      ContactScreen(
          title: Connection(title: '通讯录'),
          chatRepository: widget.chatRepository,
          contactRepository: widget.contactRepository,
          authState: widget.authState),
      MoreScreen(title: Connection(title: '设置'), authState: widget.authState),
    ];

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: tabBodies,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomTabs,
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
