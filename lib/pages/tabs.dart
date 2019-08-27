import 'package:flutter/cupertino.dart';
import 'package:elk_chat/icons.dart';
import 'package:flutter/widgets.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'chat_list/chat_list.dart';
import 'contact_list/contact_list.dart';
import 'more.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: ChatUnreadBadge(icon: IOSIcons.conversation_bubble),
          title: Text('消息'),
        ),
        BottomNavigationBarItem(
          icon: Icon(IOSIcons.person),
          title: Text('通讯录'),
        ),
        BottomNavigationBarItem(
          icon: Icon(IOSIcons.discover),
          title: Text('发现'),
        ),
        BottomNavigationBarItem(
          icon: Icon(IOSIcons.settings),
          title: Text('设置'),
        ),
      ]),
      tabBuilder: (context, index) {
        if (index == 0) {
          return ChatListPage(title: Connection(title: '消息'));
        } else if (index == 1) {
          return ContactPage(title: Connection(title: '通讯录'));
        } else if (index == 2) {
          return Center(
            child: Text('发现'),
          );
        } else {
          return MorePage(title: Connection(title: '设置'));
        }
      },
    );
  }
}
