import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/protocol/api/api.dart';

// 缓存
// todo 缓存到本地
Map<Int64, String> avatarCacher = {};

// 头像
class Avatar extends StatefulWidget {
  final double width;
  final double height;
  final Int64 avatarFileID;
  final String userName;

  Avatar(
      {Key key,
      @required this.avatarFileID,
      @required this.userName,
      @required this.width,
      @required this.height})
      : super(key: key);

  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  String imgSrc = '';

  @override
  void initState() {
    super.initState();
    if (widget.avatarFileID == 0) {
      return;
    } else if (avatarCacher[widget.avatarFileID] != null) {
      setState(() {
        imgSrc = avatarCacher[widget.avatarFileID];
      });
      return;
    }
    getFileState({'fileID': Int64.parseInt('${widget.avatarFileID}')}, (data) {
      if (!data.hasError) {
        setState(() {
          imgSrc = '${data.res.file.uRL}';
          avatarCacher[widget.avatarFileID] = imgSrc;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget placeholder = Container(
        width: widget.width,
        height: widget.height,
        color: Color(0xffeeeeee),
        child: Center(
            child: Icon(
          Icons.person,
          color: Color(0xffa4a5a7),
          size: widget.width / 1.5,
        )));
    Widget child;
    if (imgSrc.isNotEmpty) {
      child = CachedNetworkImage(
          width: widget.width,
          height: widget.height,
          fit: BoxFit.cover,
          imageUrl: imgSrc,
          placeholder: (context, url) => placeholder);
    } else {
      child = placeholder;
    }

    return child;
  }
}
