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
        if (account.user.userName.isNotEmpty) {
          yield AuthUnauthenticated(account: account);
        } else {
          yield AuthUnauthenticated();
        }
      } else {
        yield AuthAuthenticated(account: account);
      }
    }

    if (event is LoggedIn) {
      // 为什么需要这个 loading 效果？
      yield AuthLoading();
      await authRepository.persistAuthInfo(event.res);
      yield AuthAuthenticated(account: event.res);
    }

    if (event is LoggedOut) {
      var account = await authRepository.deleteAuthInfo();
      yield AuthUnauthenticated(account: account);
    }
  }
}
