// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$MachineApiService extends MachineApiService {
  _$MachineApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = MachineApiService;

  Future<Response<Machine>> readOne(String id) {
    final $url = '/machines/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Machine, Machine>($request);
  }

  Future<Response<BuiltList<Machine>>> readMany() {
    final $url = '/machines';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Machine>, Machine>($request);
  }

  Future<Response<Machine>> createOne(Machine machine) {
    final $url = '/machines';
    final $body = machine;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Machine, Machine>($request);
  }

  Future<Response> updateOne(String id, Machine machine) {
    final $url = '/machines/${id}';
    final $body = machine;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> deleteOne(String id) {
    final $url = '/machines/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
