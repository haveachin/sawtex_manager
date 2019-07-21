// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_choice_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$SizeChoiceApiService extends SizeChoiceApiService {
  _$SizeChoiceApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = SizeChoiceApiService;

  Future<Response<SizeChoice>> getOne(String id) {
    final $url = '/size-choices/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SizeChoice, SizeChoice>($request);
  }

  Future<Response<BuiltList<SizeChoice>>> getMany() {
    final $url = '/size-choices';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<SizeChoice>, SizeChoice>($request);
  }

  Future<Response<SizeChoice>> postOne(SizeChoice sizeChoice) {
    final $url = '/size-choices';
    final $body = sizeChoice;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SizeChoice, SizeChoice>($request);
  }

  Future<Response> putOne(String id, SizeChoice sizeChoice) {
    final $url = '/size-choices/${id}';
    final $body = sizeChoice;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> deleteOne(String id) {
    final $url = '/size-choices/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
