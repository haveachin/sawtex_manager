import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/city.dart';
import 'package:sawtex_manager/widgets/manager/bloc/service.dart';

part 'city_api_service.chopper.dart';

@ChopperApi(baseUrl: '/cities')
abstract class CityApiService extends ChopperService implements ApiService<City> {
  @Get(path: '/{id}')
  Future<Response<City>> getCity(
    @Path('id') String id,
  );

  @Get()
  Future<Response<BuiltList<City>>> getCities();

  @Post()
  Future<Response<City>> postCity(
    @Body() City city,
  );

  @Put(path: '/{id}')
  Future<Response> putCity(
    @Path('id') String id,
    @Body() City city,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteCity(
    @Path('id') String id,
  );

  @Get(path: '/{id}')
  Future<Response<City>> getOne(
    @Path('id') String id,
  );
  
  @Get()
  Future<Response<BuiltList<City>>> getMany();

  @Post()
  Future<Response<City>> postOne(
    @Body() City city,
  );

  @Put(path: '/{id}')
  Future<Response> putOne(
    @Path('id') String id,
    @Body() City city,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteOne(
    @Path('id') String id,
  );

  static CityApiService create([ChopperClient client]) =>
      _$CityApiService(client);
}
