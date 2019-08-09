import 'package:elk_chat/protocol/protobuf/koi.pb.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthState extends Equatable {
  AuthState({UserLoginResp account});
}

class AuthUninitialized extends AuthState {
  @override
  String toString() => 'AuthUninitialized';
}

class AuthAuthenticated extends AuthState {
  final UserLoginResp account;
  AuthAuthenticated({@required this.account}) : super(account: account);

  @override
  String toString() => 'AuthAuthenticated:$account';
}

class AuthUnauthenticated extends AuthState {
  final UserLoginResp account;
  AuthUnauthenticated({this.account}) : super(account: account);

  @override
  String toString() => 'AuthUnauthenticated:$account';
}

class AuthLoading extends AuthState {
  @override
  String toString() => 'AuthLoading';
}
