import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/api_error.dart';

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class AuthInitial extends AuthState {}

class LoggingIn extends AuthState {}

class LoggedIn extends AuthState {}

class LoginFailed extends AuthState {
  final ApiError error;

  LoginFailed(this.error) : super([error]);
}
