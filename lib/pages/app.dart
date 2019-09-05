import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:elk_chat/widgets/widgets.dart';
import 'pages.dart';
import 'tabs.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  String resp = "Init";

  @override
  Widget build(BuildContext context) {
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

    return WillPopScope(
      child: BlocBuilder<AuthBloc, AuthState>(
        bloc: _authBloc,
        builder: (context, state) {
          List<Widget> children = <Widget>[
            ConnectionWatcher(
              authState: state,
            ),
          ];
          Widget tmp;
          // 如果已经登录。渲染首页
          if (state is AuthAuthenticated) {
            tmp = TabsPage();
          } else if (state is AuthUnauthenticated) {
            // 如果没有token信息。渲染登录页
            tmp = LoginPage();
          } else {
            tmp = Scaffold(body: Center(child: CupertinoActivityIndicator()));
          }
          children.add(tmp);
          return Stack(
            children: children,
          );
        },
      ),
      onWillPop: () {
        return _dialogExitApp(context);
      }
    );
  }

  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          child: CupertinoAlertDialog(
            title: Text('温馨提示'),
            content: Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text('要退出应用?')
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                  onPressed: () {
                    return Navigator.of(context).pop(false);
                  },
                  child: Text('取消')),
              CupertinoDialogAction(
                  onPressed: () {
                    return Navigator.of(context).pop(true);
                  },
                  child: Text('确定'))
            ],
          ),
          onWillPop: () async {
            return true;
          }
        );
      }
    );
  }
}
