import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class ValidateToken extends AuthEvent {
  final String tokenString;

  ValidateToken(this.tokenString) : super([tokenString]);
}

class Login extends AuthEvent {
  final String username, password;

  Login(this.username, this.password) : super([username, password]);
}
