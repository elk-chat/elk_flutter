import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String userName;
  final String password;

  LoginButtonPressed({
    @required this.userName,
    @required this.password,
  }) : super([userName, password]);

  @override
  String toString() =>
      'LoginButtonPressed { userName: $userName, password: $password }';
}
