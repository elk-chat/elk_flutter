import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:elk_chat/repositorys/repositorys.dart';
import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({@required this.authRepository});

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      var account = await authRepository.getAuthInfo();
      if (account.token.isEmpty) {
        yield AuthUnauthenticated(account: account);
      } else {
        yield AuthAuthenticated(account: account);
      }
    }

    if (event is UpdateUser) {
      var account = (currentState as AuthAuthenticated).account;
      account.user = event.user;
      authRepository.persistAuthInfo(account);
      yield AuthAuthenticated(account: account);
    }

    if (event is LoggedIn) {
      // 为什么需要这个 loading 效果？
      yield AuthLoading();
      yield AuthAuthenticated(account: event.res);
    }

    if (event is LoggedOut) {
      var account = await authRepository.deleteAuthInfo();
      yield AuthUnauthenticated(account: account);
    }
  }
}
