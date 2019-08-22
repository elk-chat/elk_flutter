import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupChatDetailScreen extends StatefulWidget {
  final Widget title;

  GroupChatDetailScreen({Key key, @required this.title}) : super(key: key);

  @override
  _GroupChatDetailState createState() => _GroupChatDetailState();
}

class _GroupChatDetailState extends State<GroupChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Text('聊天信息/退出聊天/添加成员/移除成员'),
          Text('查看媒体/编辑群信息（头像/群标题）')
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
