import 'dart:io';

import 'package:elk_chat/protocol/api_util/api_util.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/material_community_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class GroupInfoEdit extends StatelessWidget {
  final Int64 avatarFileID;
  final TextEditingController controller;
  final Function setText;
  final Function setUploading;
  final Function setFinish;
  final bool uploading;
  final BuildContext context;

  final int avaterSize = 256;

  const GroupInfoEdit({
    Key key,
    @required this.avatarFileID,
    @required this.controller,
    @required this.setText,
    @required this.setUploading,
    @required this.setFinish,
    @required this.uploading,
    @required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Img(
                    key: ValueKey(avatarFileID),
                    type: ChatType.Group,
                    fileID: avatarFileID,
                    width: 64.0,
                    height: 64.0)),
            Container(
                child: Flexible(
                    child: TextField(
              autofocus: true,
              controller: controller,
              onChanged: (value) {
                setText(value.trim());
              },
              textInputAction: TextInputAction.go,
              // style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                  hintText: "群名称",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                        MaterialCommunityIcons.getIconData('close-circle'),
                        color: Colors.black38,
                        size: 18,
                      ),
                      onPressed: () {
                        setText('');

                        WidgetsBinding.instance
                            .addPostFrameCallback((_) => controller.clear());
                      })),
            ))),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 90.0),
          decoration: BoxDecoration(
            border: Border(
                top: const BorderSide(color: Colors.black12, width: 0.5)),
          ),
        ),
        Container(
            child: CupertinoButton(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Text(uploading ? '正在上传..' : '设置封面',
              style: const TextStyle(fontSize: 15.0)),
          onPressed: onChangeAvatar,
        )),
        Container(
          decoration: BoxDecoration(
            border: Border(
                top: const BorderSide(color: Colors.black12, width: 0.5)),
          ),
        )
      ],
    ));
  }

  onChangeAvatar() {
    showCupertinoModalPopup(
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('选择封面'),
            // message: Text('请选择'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('拍照', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  getImageFromCamera();
                },
              ),
              CupertinoActionSheetAction(
                child: Text('相册', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  getImageFromGallery();
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

  // 从图库获取图片
  Future getImageFromGallery() async {
    try {
      File imageFile = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 30);
      Navigator.of(context).pop(false);
      _cropImage(imageFile);
    } catch (e) {
      var error = "图库选择图片出错 $e";
      showError(error);
    }
  }

  // 从相机获取图片
  Future getImageFromCamera() async {
    try {
      File imageFile = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 30);
      Navigator.of(context).pop(false);
      _cropImage(imageFile);
    } catch (e) {
      var error = "相机拍摄图片出错 $e";
      showError(error);
    }
  }

  Future<Null> _cropImage(File imageFile) async {
    if (imageFile == null) return;
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: avaterSize,
      maxHeight: avaterSize,
    );
    if (croppedFile == null) return;
    sendFile(croppedFile);
  }

  sendFile(File file) async {
    setUploading();
    var bytes = await file.readAsBytes();

    UtilityUploadReq _UtilityUploadReq = UtilityUploadReq();
    _UtilityUploadReq.data = bytes;
    _UtilityUploadReq.fileName = file.path.split('/').last;
    _UtilityUploadReq.contentType = ChatContentType.Image;
    _UtilityUploadReq.width = avaterSize;
    _UtilityUploadReq.height = avaterSize;

    uploadFile(_UtilityUploadReq, (data) async {
      _UtilityUploadReq.clear();
      Int64 _avatarFileID;
      if (data.hasError) {
        print('上传文件错误 ${data.res}');
      } else {
        // DfsFile;
        print('上传成功 ${data.res.file}');
        // 缓存图片
        await DefaultCacheManager().putFile(data.res.file.uRL, bytes);
        bytes = null;
        _avatarFileID = data.res.file.fileID;
      }
      setFinish(_avatarFileID);
    });
  }

  showError(String error) {
    print(error);

    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
