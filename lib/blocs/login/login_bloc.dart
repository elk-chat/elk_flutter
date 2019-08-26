import 'dart:async';

import 'package:elk_chat/init_websocket.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:elk_chat/blocs/auth/auth.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authenticationBloc;

  LoginBloc({
    @required this.authenticationBloc,
  }) : assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final res = await $CH.authApi.auth(
          userName: event.userName,
          password: event.password,
        );

        authenticationBloc.dispatch(LoggedIn(res: res));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
