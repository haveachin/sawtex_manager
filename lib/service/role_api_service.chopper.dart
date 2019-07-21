// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RoleApiService extends RoleApiService {
  _$RoleApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RoleApiService;

  Future<Response<Role>> getOne(String id) {
    final $url = '/roles/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Role, Role>($request);
  }

  Future<Response<BuiltList<Role>>> getMany() {
    final $url = '/roles';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Role>, Role>($request);
  }

  Future<Response<Role>> postOne(Role role) {
    final $url = '/roles';
    final $body = role;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Role, Role>($request);
  }

  Future<Response> putOne(String id, Role role) {
    final $url = '/roles/${id}';
    final $body = role;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> deleteOne(String id) {
    final $url = '/roles/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
