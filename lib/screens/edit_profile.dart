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
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.add,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
