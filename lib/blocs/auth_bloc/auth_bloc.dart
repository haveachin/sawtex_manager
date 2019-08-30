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

  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is ValidateToken) {
      yield LoggingIn();
      yield await _validateToken(event.token);
    } else if (event is Login) {
      yield LoggingIn();
      yield await _login(event.credentials, event.rememberMe);
    }
  }

  Future<AuthState> _validateToken(Token token) async {
    AuthState state;

    try {
      await authApiService.validateToken(token.toString());
      ApiClients.authorize(token);
      state = LoggedIn();
    } on Response<ApiError> catch (response) {
      state = LoginFailed(response.body);
      Token.deleteFromSecureStorage();
    } on Exception catch (_) {
      state = LoginFailed(ApiError.couldNotReach(authApiService));
    }

    return state;
  }

  Future<AuthState> _login(Credentials credentials, bool rememberMe) async {
    AuthState state;

    credentials = Credentials.encode(
        username: credentials.username, password: credentials.password);

    try {
      final response = await authApiService.loginAdmin(credentials);
      final token = response.body;
      if (rememberMe) token.saveToSecureStorage();
      ApiClients.authorize(token);
      state = LoggedIn();
    } on Response<ApiError> catch (response) {
      state = LoginFailed(response.body);
    } on Exception catch (_) {
      state = LoginFailed(ApiError.couldNotReach(authApiService));
    }

    return state;
  }
}
