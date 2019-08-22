import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 编辑个人资料
class EditProfileScreen extends StatefulWidget {
  final String title;

  EditProfileScreen({Key key, @required this.title}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
          child: CupertinoButton(
              color: Colors.blue,
              onPressed: onChangeAvatar,
              child: Text('更换头像', style: TextStyle(color: Colors.white)))),
    );
  }

  onChangeAvatar() {
    showCupertinoModalPopup(
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            // title: Text('请选择'),
            // message: Text('请选择'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('拍照', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoActionSheetAction(
                child: Text('相册', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消', style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
