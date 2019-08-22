import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneToOneChatDetailScreen extends StatefulWidget {
  final Widget title;

  OneToOneChatDetailScreen({Key key, @required this.title}) : super(key: key);

  @override
  _OneToOneChatDetailState createState() => _OneToOneChatDetailState();
}

class _OneToOneChatDetailState extends State<OneToOneChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        centerTitle: true,
      ),
      body: Container(child: Text('聊天信息')),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
