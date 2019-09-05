import 'dart:io';

import 'package:elk_chat/widgets/check_version.dart';
import 'package:elk_chat/widgets/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 编辑个人资料
class SettingPage extends StatelessWidget {
  final String title;
  final onLogout;

  SettingPage({
    Key key, 
    @required this.onLogout,
    this.title = '设置',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: SafeArea(
        child: Container(
          child: (
            Column(
              children: <Widget>[
                ListItem(
                  title: Text('版本'),
                  actionTip: true,
                  onTap: () {
                    VersionChecker versionChecker = VersionChecker();
                    versionChecker.checkVersion(context);
                  },
                ),
                SizedBox(height: 30),
                ListItem(
                  title: Text('退出登录'),
                  actionTip: true,
                  onTap: onLogout,
                ),
              ],
            )
          )
        )
      ),
    );
  }
}
