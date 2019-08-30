// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compartment_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$CompartmentApiService extends CompartmentApiService {
  _$CompartmentApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = CompartmentApiService;

  Future<Response<Compartment>> readOne(String id) {
    final $url = '/compartments/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Compartment, Compartment>($request);
  }

  Future<Response<BuiltList<Compartment>>> readMany(String filter) {
    final $url = '/compartments/?filter=${filter}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Compartment>, Compartment>($request);
  }

  Future<Response<Compartment>> createOne(Compartment compartment) {
    final $url = '/compartments';
    final $body = compartment;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Compartment, Compartment>($request);
  }

  Future<Response> updateOne(String id, Compartment compartment) {
    final $url = '/compartments/${id}';
    final $body = compartment;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> deleteOne(String id) {
    final $url = '/compartments/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
