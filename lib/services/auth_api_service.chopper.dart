// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AuthApiService extends AuthApiService {
  _$AuthApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AuthApiService;

  Future<Response<Token>> loginAdmin(Credentials body) {
    final $url = '/login/admin';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Token, Token>($request);
  }

  Future<Response> validateToken(String tokenStringWithBearer) {
    final $url = '/login/token';
    final $headers = {'Authorization': tokenStringWithBearer};
    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
