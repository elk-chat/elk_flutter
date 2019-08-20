import 'package:elk_chat/init_websocket.dart';
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
    final ChatBloc chatBloc = BlocProvider.of<ChatBloc>(context);

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
                      showCupertinoModalPopup(
                          builder: (BuildContext context) {
                            return CupertinoActionSheet(
                              title: Text('退出登录'),
                              message: Text('请选择退出方式'),
                              actions: <Widget>[
                                CupertinoActionSheetAction(
                                  child: Text('退出'),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                    $CH.clear();
                                    authBloc.dispatch(LoggedOut());
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: Text('清除记录并退出'),
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
                                child: Text('取消'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                          context: context);
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
