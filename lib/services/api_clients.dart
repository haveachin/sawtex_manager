import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawtex_manager/models/token.dart';

import 'auth_api_service.dart';
import 'built_value_converter.dart';
import 'compartment_api_service.dart';
import 'machine_api_service.dart';

class ApiClients {
  static final String protocol = 'http';
  static final String address = '192.168.2.30:8080'; //192.168.2.30:8080
  static final int version = 1;

  static ChopperClient _login, _authorized;

  static ChopperClient get login => _login;
  static ChopperClient get authorized => _authorized;

  static Future init() async {
    _login = ChopperClient(
      baseUrl: '$protocol://$address',
      services: [
        AuthApiService.create(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
    );
  }

  static void authorize(Token token) {
    _authorized = ChopperClient(
      baseUrl: '$protocol://$address/v$version',
      services: [
        //CityApiService.create(),
        MachineApiService.create(),
        CompartmentApiService.create(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
      interceptors: [
        HeadersInterceptor({'Authorization': token.toString()}),
      ],
    );
  }

  static void dispose() {
    _login.dispose();
    _authorized.dispose();
  }
}
