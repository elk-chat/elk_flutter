import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elk_chat/blocs/blocs.dart';
// import 'edit_profile.dart';
import 'package:elk_chat/widgets/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 获取认证 bloc，用于登出请求
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final ContactBloc contactBloc = BlocProvider.of<ContactBloc>(context);
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
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               fullscreenDialog: true,
        //               builder: (BuildContext context) =>
        //                   EditProfileScreen(title: '个人信息')));
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: <Widget>[
          ContactWidget(avatarSize: 74.0, contact: userInfo.user),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: CupertinoButton(
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            // SystemChrome.setEnabledSystemUIOverlays([]);
                            return WillPopScope(
                                child: CupertinoAlertDialog(
                                  title: Text('温馨提示'),
                                  content: Container(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text('要退出登录?')),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                        onPressed: () {
                                          // SystemChrome
                                          //     .setEnabledSystemUIOverlays(
                                          //         SystemUiOverlay.values);
                                          return Navigator.of(context)
                                              .pop(false);
                                        },
                                        child: Text('取消')),
                                    CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                          // SystemChrome
                                          //     .setEnabledSystemUIOverlays(
                                          //         SystemUiOverlay.values);
                                          contactBloc.dispatch(ClearContact());
                                          authBloc.dispatch(LoggedOut());
                                        },
                                        child: Text('确定'))
                                  ],
                                ),
                                onWillPop: () async {
                                  // await SystemChrome.setEnabledSystemUIOverlays(
                                  //     SystemUiOverlay.values);
                                  return true;
                                });
                          });
                    },
                    child:
                        Text('退出登录', style: TextStyle(color: Colors.white)))),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
