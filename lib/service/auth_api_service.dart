import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/credentials.dart';
import 'package:sawtex_manager/models/token.dart';

part 'auth_api_service.chopper.dart';

@ChopperApi(baseUrl: '/login')
abstract class AuthApiService extends ChopperService {
  @Post(path: '/admin')
  Future<Response<Token>> loginAdmin(
    @Body() Credentials body,
  );

  static AuthApiService create([ChopperClient client]) =>
      _$AuthApiService(client);
}
