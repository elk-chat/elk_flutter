import 'dart:async';

import 'package:elk_chat/widgets/divid.dart';
import 'package:elk_chat/widgets/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DiscoverPage extends StatelessWidget {
  final title;
  
  DiscoverPage({
    Key key,
    @required this.title,
  }) : super(key: key);

  bool isShowing = false;

  doing() {
    // Fluttertoast.cancel();
    if(isShowing) return;
    isShowing = true;
    Fluttertoast.showToast(
      msg: "施工中，敬请期待",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 2,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      fontSize: 16.0
    );
    doStuffCallback() {
      isShowing = false;
    }
    var timer = Timer(const Duration(milliseconds: 2), doStuffCallback);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: 'DiscoverPage',
        transitionBetweenRoutes: false,
        // heroTag: 'NewChat',
        middle: Text(title),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.add,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0,),
            ListItem(
              title: Text('朋友圈'),
              onTap: doing,
            ),
            Divid(),
            SizedBox(height: 10.0,),
            ListItem(
              title: Text('扫一扫'),
              onTap: doing,
            ),
            ListItem(
              title: Text('看一看'),
              onTap: doing,
            ),
            ListItem(
              title: Text('搜一搜'),
              onTap: doing,
            ),
            Divid(),
            SizedBox(height: 10.0,),
            ListItem(
              title: Text('游戏'),
              onTap: doing,
            ),
            Divid(),
          ],
        ),
      ),
    );
  }
}
