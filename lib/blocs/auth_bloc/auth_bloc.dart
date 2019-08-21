import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawtex_manager/models/api_error.dart';
import 'package:sawtex_manager/models/credentials.dart';
import 'package:sawtex_manager/models/token.dart';
import 'package:sawtex_manager/services/api_clients.dart';
import 'package:sawtex_manager/services/auth_api_service.dart';

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
      yield LoggingIn();
      yield await _validateToken();
    } else if (event is Login) {
      yield LoggingIn();
      yield await _login(event.username, event.password);
    }
  }

  Future<AuthState> _validateToken() async {
    AuthState state;

    try {
      final String tokenString =
          await storage.read(key: Token.secureStorageKey);
      await authApiService.validateToken('Bearer $tokenString');
      ApiClients.authorize(tokenString);
      state = LoggedIn();
    } on Response<ApiError> catch (response) {
      state = LoginFailed(response.body);
    } on Exception catch (_) {
      state =
          LoginFailed(ApiError.couldNotReach(authApiService.client.baseUrl));
    }
    return state;
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
      final tokenString = response.body.token;
      storage.write(key: Token.secureStorageKey, value: tokenString);
      ApiClients.authorize(tokenString);
      state = LoggedIn();
    } on Response<ApiError> catch (response) {
      state = LoginFailed(response.body);
    } on Exception catch (_) {
      state =
          LoginFailed(ApiError.couldNotReach(authApiService.client.baseUrl));
    }

    return state;
  }
}
