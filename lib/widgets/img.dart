import 'package:cached_network_image/cached_network_image.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/image_viewer.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/protocol/api_util/api_util.dart';


// 缓存
// todo 缓存到本地
Map<Int64, String> avatarCacher = {};

Map<Int64, String> userIDsCacher = {};

// 头像类型
Map<int, IconData> avatarTypeMap = {
  1: Icons.group,
  2: Icons.person,
  3: Icons.image
};

// 图片
class Img extends StatefulWidget {
  final int type;
  final double width;
  final double height;
  final Int64 fileID;
  final String title;
  final bool hasTap;

  Img(
      {Key key,
      this.type = 2,
      this.fileID,
      this.title,
      this.hasTap = false,
      @required this.width,
      @required this.height})
      : super(key: key);

  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Img> {
  String imgSrc = '';
  UtilityFileStatReq _UtilityFileStatReq = UtilityFileStatReq();

  @override
  void initState() {
    super.initState();
    if (widget.fileID == 0 || widget.fileID == null) {
      return;
    } else if (avatarCacher[widget.fileID] != null) {
      imgSrc = avatarCacher[widget.fileID];
      return;
    }
    _UtilityFileStatReq.fileID = widget.fileID;
    getFileState(_UtilityFileStatReq, (data) {
      if (!data.hasError && mounted) {
        setState(() {
          imgSrc = '${data.res.file.uRL}';
          avatarCacher[widget.fileID] = imgSrc;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget placeholder = Container(
        width: widget.width,
        height: widget.height,
        color: const Color(0xffeeeeee),
        child: Center(
            child: Icon(
          avatarTypeMap[widget.type],
          color: const Color(0xffa4a5a7),
          size: widget.width / 1.6,
        )));
    Widget child;
    if (imgSrc.isNotEmpty) {
      child = GestureDetector(
          onTap: widget.hasTap
              ? () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return ImageViewer(
                        imageProviders: [CachedNetworkImageProvider(imgSrc)],
                      );
                    },
                  );
                }
              : null,
          child: CachedNetworkImage(
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
              imageUrl: imgSrc,
              placeholder: (context, url) => placeholder));
    } else {
      child = placeholder;
    }

    return child;
  }
}
