import 'dart:io';

import 'package:elk_chat/init_websocket.dart';
import 'package:elk_chat/protocol/api/api.dart';
import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:elk_chat/screens/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elk_chat/blocs/blocs.dart';
// import 'edit_profile.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_icons/flutter_icons.dart';

// 内置浏览器打开链接
// import 'package:url_launcher/url_launcher.dart';
// const url = 'https://flutter.dev';
// if (await canLaunch(url)) {
//   await launch(url, statusBarBrightness: Brightness.light, forceSafariVC: true, forceWebView: true);
// } else {
//   throw 'Could not launch $url';
// }

class MoreScreen extends StatefulWidget {
  final title;
  final AuthAuthenticated authState;

  MoreScreen({Key key, @required this.title, @required this.authState})
      : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen>
    with AutomaticKeepAliveClientMixin<MoreScreen> {
  AuthBloc authBloc;
  ContactBloc contactBloc;
  ChatBloc chatBloc;
  int avaterSize = 256;

  @override
  void initState() {
    super.initState();
    // 获取认证 bloc，用于登出请求
    authBloc = BlocProvider.of<AuthBloc>(context);
    contactBloc = BlocProvider.of<ContactBloc>(context);
    chatBloc = BlocProvider.of<ChatBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var userInfo = widget.authState.account;
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        centerTitle: true,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       MaterialCommunityIcons.getIconData('square-edit-outline'),
        //       size: 22,
        //     ),
        //     onPressed: goToProfile,
        //   ),
        // ],
      ),
      body: Column(
        children: <Widget>[
          ContactWidget(
            avatarSize: 74.0,
            user: userInfo.user,
            onTap: onChangeAvatar,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: CupertinoButton(
                    color: Colors.red,
                    onPressed: onLogout,
                    child:
                        Text('退出登录', style: TextStyle(color: Colors.white)))),
          ),
        ],
      ),
    );
  }

  goToProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                EditProfileScreen(title: '个人信息')));
  }

  onChangeAvatar() {
    showCupertinoModalPopup(
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('更换头像'),
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
    var bytes = await file.readAsBytes();

    UtilityUploadReq _UtilityUploadReq = UtilityUploadReq();
    _UtilityUploadReq.data = bytes;
    _UtilityUploadReq.fileName = file.path.split('/').last;
    _UtilityUploadReq.contentType = ChatContentType.Image;
    _UtilityUploadReq.width = avaterSize;
    _UtilityUploadReq.height = avaterSize;

    uploadFile(_UtilityUploadReq, (data) async {
      _UtilityUploadReq.clear();
      if (data.hasError) {
        print('上传文件错误 ${data.res}');
      } else {
        // DfsFile;
        print('上传成功 ${data.res.file}');

        UserUpdateProfileReq _UserUpdateProfileReq = UserUpdateProfileReq();
        _UserUpdateProfileReq.avatarFileID = data.res.file.fileID;
        $CH.user.avatarFileID = data.res.file.fileID;
        authBloc.dispatch(UpdateUser(user: $CH.user));
        updateProfile(_UserUpdateProfileReq, (data) {
          if (data.hasError) {
            showError('更新头像报错 ${data.res}');
          } else {
            print('头像已更新 $data');

            setState(() {});
          }
        });
        // 缓存图片
        await DefaultCacheManager().putFile(data.res.file.uRL, bytes);
        bytes = null;
      }
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

  onLogout() {
    showCupertinoModalPopup(
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('请选择退出方式'),
            // message: Text('请选择退出方式'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('退出', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  $CH.clear();
                  authBloc.dispatch(LoggedOut());
                },
              ),
              CupertinoActionSheetAction(
                child: Text('清除记录退出', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  $CH.clear();
                  authBloc.dispatch(LoggedOut());
                  contactBloc.dispatch(ClearContact());
                  chatBloc.dispatch(ClearChat());
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

  @override
  bool get wantKeepAlive => true;
}
