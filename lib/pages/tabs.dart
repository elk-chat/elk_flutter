import 'package:elk_chat/widgets/chat_icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:elk_chat/widgets/icon_badge.dart';
import '../widgets/widgets.dart';
import 'chat_list/chat_list.dart';
import 'contact_list/contact_list.dart';
import 'more.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
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
        activeIcon: ChatUnreadBadge(
            size: _iconSize, icon: MaterialIcons.getIconData('chat-bubble')),
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
      ChatListPage(title: Connection(title: '消息')),
      ContactPage(title: Connection(title: '通讯录')),
      MorePage(title: Connection(title: '设置')),
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
