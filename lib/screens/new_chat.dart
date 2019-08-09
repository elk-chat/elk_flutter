import 'package:flutter/material.dart';

// 添加新消息
class NewChatScreen extends StatefulWidget {
  final String title;

  NewChatScreen({Key key, @required this.title}) : super(key: key);

  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
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
