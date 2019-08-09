import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elk_chat/repositorys/repositorys.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'index.dart';
import 'tabs.dart';

// 初始化连接 websocket

class RootScreen extends StatelessWidget {
  final AuthRepository authRepository;
  final ChatRepository chatRepository;
  final ContactRepository contactRepository;
  RootScreen(
      {Key key,
      @required this.authRepository,
      @required this.chatRepository,
      @required this.contactRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

    return WillPopScope(
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: _authBloc,
          builder: (context, state) {
            // 如果已经登录。渲染首页
            if (state is AuthAuthenticated) {
              return Stack(children: <Widget>[
                TabsScreen(
                    authState: state, contactRepository: contactRepository),
                ConnectionWatcher(authRepository: authRepository),
              ]);
            }
            // 如果没有token信息。渲染登录页
            if (state is AuthUnauthenticated) {
              return LoginScreen(
                  authRepository: authRepository, authState: state);
            }
            var loading =
                Scaffold(body: Center(child: CupertinoActivityIndicator()));
            // 如果正在请求中，渲染 loading
            if (state is AuthLoading) {
              return loading;
            }
            // 渲染启动页
            return loading;
          },
        ),
        onWillPop: () {
          return _dialogExitApp(context);
        });
  }

  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          // SystemChrome.setEnabledSystemUIOverlays([]);
          return WillPopScope(
              child: CupertinoAlertDialog(
                title: Text('温馨提示'),
                content: Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('要退出应用?')),
                actions: <Widget>[
                  CupertinoDialogAction(
                      onPressed: () {
                        // SystemChrome.setEnabledSystemUIOverlays(
                        //     SystemUiOverlay.values);
                        return Navigator.of(context).pop(false);
                      },
                      child: Text('取消')),
                  CupertinoDialogAction(
                      onPressed: () {
                        // SystemChrome.setEnabledSystemUIOverlays(
                        //     SystemUiOverlay.values);
                        return Navigator.of(context).pop(true);
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
  }
}
