import 'dart:async';

import 'package:elk_chat/init_websocket.dart';
import 'package:bloc/bloc.dart';
import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      var account = await $CH.authApi.getAuthInfo();
      if (account.token.isEmpty) {
        yield AuthUnauthenticated(account: account);
      } else {
        yield AuthAuthenticated(account: account);
      }
    }

    if (event is UpdateUser) {
      var account = (currentState as AuthAuthenticated).account;
      account.user = event.user;
      $CH.authApi.persistAuthInfo(account);
      yield AuthAuthenticated(account: account);
    }

    if (event is LoggedIn) {
      // 为什么需要这个 loading 效果？
      yield AuthLoading();
      yield AuthAuthenticated(account: event.res);
    }

    if (event is LoggedOut) {
      var account = await $CH.authApi.deleteAuthInfo();
      yield AuthUnauthenticated(account: account);
    }
  }
}
