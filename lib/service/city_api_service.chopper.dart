// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$CityApiService extends CityApiService {
  _$CityApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = CityApiService;

  Future<Response<City>> getCity(String id) {
    final $url = '/cities/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<City, City>($request);
  }

  Future<Response<BuiltList<City>>> getCities() {
    final $url = '/cities';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<City>, City>($request);
  }

  Future<Response<City>> postCity(City city) {
    final $url = '/cities';
    final $body = city;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<City, City>($request);
  }

  Future<Response> putCity(String id, City city) {
    final $url = '/cities/${id}';
    final $body = city;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> deleteCity(String id) {
    final $url = '/cities/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
