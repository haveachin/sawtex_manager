import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawtex_manager/models/api_error.dart';
import 'package:sawtex_manager/models/credentials.dart';
import 'package:sawtex_manager/models/token.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/auth_api_service.dart';

import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authApiService = AuthApiService.create(ApiClients.login);
  final storage = FlutterSecureStorage();

  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is ValidateToken) {
      yield LoggedIn(Token((b) => b..token = event.tokenString));
    } else if (event is Login) {
      yield LoggingIn();
      final responseEvent = await _login(event.username, event.password);

      if (responseEvent is LoginFailed) {
        yield responseEvent;
      } else if (responseEvent is LoggedIn) {
        await storage.write(
            key: Token.secureStorageKey, value: responseEvent.token.token);
        ApiClients.authorize(responseEvent.token.token);
        yield LoggedIn(responseEvent.token);
      }
    }
  }

  Future<AuthState> _login(String username, String password) async {
    final bytes = utf8.encode(password);
    password = base64.encode(bytes);

    final credentials = Credentials(
      (b) => b
        ..username = username
        ..password = password,
    );

    AuthState state;

    try {
      final response = await authApiService.loginAdmin(credentials);
      state = LoggedIn(response.body);
    } on Response<ApiError> catch (response) {
      state = LoginFailed(response.body);
    } on Exception catch (_) {
      final err = ApiError(
        (b) => b
          ..status = 503
          ..timestamp = DateTime.now().millisecondsSinceEpoch
          ..message = "Could not reach ${authApiService.client.baseUrl}",
      );

      state = LoginFailed(err);
    }

    return state;
  }
}
