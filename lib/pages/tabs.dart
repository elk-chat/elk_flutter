import 'package:flutter/cupertino.dart';
import 'package:elk_chat/icons.dart';
import 'package:flutter/widgets.dart';
import 'package:elk_chat/widgets/widgets.dart';
import '../theme_cupertino.dart';
import 'chat_list/chat_list.dart';
import 'contact_list/contact_list.dart';
import 'discover/discover.dart';
import 'more.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Themes.themeColor,
        items: [
          BottomNavigationBarItem(
            icon: ChatUnreadBadge(icon: IOSIcons.conversation_bubble),
            title: Text('消息'),
            activeIcon: ChatUnreadBadge(icon: IOSIcons.conversation_bubble_filled),
            backgroundColor: Themes.themeColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(IOSIcons.person),
            activeIcon: Icon(IOSIcons.person_solid),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IOSIcons.discover),
            // activeIcon: Icon(IOSIcons.person_solid),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IOSIcons.settings),
            activeIcon: Icon(IOSIcons.settings_solid),
            title: Text('设置'),
          ),
        ]
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return ChatListPage(title: Connection(title: '消息'));
        } else if (index == 1) {
          return ContactPage(title: Connection(title: '通讯录'));
        } else if (index == 2) {
          return DiscoverPage(
            title: '发现',
          );
        } else {
          return MorePage(title: Connection(title: '设置'));
        }
      },
    );
  }
}
