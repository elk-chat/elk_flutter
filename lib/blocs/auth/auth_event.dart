import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  final dynamic res;

  LoggedIn({@required this.res}) : super([res]);

  @override
  String toString() => 'LoggedIn { res: $res }';
}

class LoggedOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}
