import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawtex_manager/models/token.dart';

import 'api_error_converter.dart';
import 'auth_api_service.dart';
import 'built_value_converter.dart';
import 'city_api_service.dart';

class ApiClients {
  static ChopperClient _login, _authorized;

  static ChopperClient get login => _login;
  static ChopperClient get authorized => _authorized;

  static Future init() async {
    _login = ChopperClient(
      baseUrl: 'http://192.168.2.30:8080',
      services: [
        AuthApiService.create(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: ApiErrorConverter(),
    );

    final token = await FlutterSecureStorage().read(key: Token.secureStorageKey);
    authorize(token);
  }

  static void authorize(String token) {
    _authorized = ChopperClient(
      baseUrl: 'http://192.168.2.30:8080/v1',
      services: [
        CityApiService.create(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: ApiErrorConverter(),
      interceptors: [
        HeadersInterceptor({'Authorization': 'Bearer $token'}),
      ],
    );
  }

  static void dispose() {
    _login.dispose();
    _authorized.dispose();
  }
}