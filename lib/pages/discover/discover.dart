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
      timeInSecForIos: 1,
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
              actionTip: true,
              leading: Icon(
                Icons.camera,
                color: Color(0xff0a8cff),
              ),
              onTap: doing,
            ),
            Divid(),
            SizedBox(height: 10.0,),
            ListItem(
              title: Text('扫一扫'),
              actionTip: true,
              leading: Icon(
                Icons.camera_alt,
                color: Color(0xff0a8cff),
              ),
              onTap: doing,
            ),
            ListItem(
              title: Text('看一看'),
              actionTip: true,
              leading: Icon(
                Icons.photo_album,
                color: Color(0xfffda929),
              ),
              onTap: doing,
            ),
            ListItem(
              title: Text('搜一搜'),
              actionTip: true,
              leading: Icon(
                Icons.search,
                color: Color(0xff0fd279),
              ),
              onTap: doing,
            ),
            Divid(),
            SizedBox(height: 10.0,),
            ListItem(
              title: Text('游戏'),
              actionTip: true,
              leading: Icon(
                Icons.gamepad,
                color: Color(0xfffc4173),
              ),
              onTap: doing,
            ),
            Divid(),
          ],
        ),
      ),
    );
  }
}
