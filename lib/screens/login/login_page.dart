import 'package:flutter/material.dart';
import 'package:elk_chat/repositorys/auth_repository.dart';
import 'package:elk_chat/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final AuthRepository authRepository;
  final AuthState authState;
  LoginScreen({Key key, @required this.authRepository, @required this.authState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      builder: (context) {
        // 登录 bloc 需要两个参数，认证 bloc 和 用户 Repository
        return LoginBloc(
          authenticationBloc: BlocProvider.of<AuthBloc>(context),
          authRepository: authRepository,
        );
      },
      child: _buildPageContent(context),
    ));
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: LoginForm(authState: authState),
    );
  }
}
