import 'package:built_value/serializer.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/credentials.dart';
import 'package:sawtex_manager/models/serializers.dart';
import 'package:sawtex_manager/models/token.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class ValidateToken extends AuthEvent {
  final Token token;

  ValidateToken(this.token) : super([token]);
}

class Login extends AuthEvent {
  final Credentials credentials;
  final bool rememberMe;

  Login(this.credentials, this.rememberMe) : super([credentials, rememberMe]);

  factory Login.fromMap(Map<String, dynamic> map) {
    final credentials =
        serializers.deserializeWith(Credentials.serializer, map);
    final rememberMe = map['rememberMe'] ?? false;
    return Login(credentials, rememberMe);
  }
}
