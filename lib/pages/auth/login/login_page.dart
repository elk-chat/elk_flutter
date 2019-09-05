import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: BlocProvider(
        builder: (context) {
          // 登录 bloc 需要两个参数，认证 bloc 和 用户 Apisitory
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthBloc>(context),
          );
        },
        child: _buildPageContent(context),
      )
    );
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: LoginForm(),
    );
  }
}
