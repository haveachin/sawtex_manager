import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/compartment.dart';

import 'curd_service.dart';

part 'compartment_api_service.chopper.dart';

@ChopperApi(baseUrl: '/compartments')
abstract class CompartmentApiService extends ChopperService implements CurdService<Compartment> {
  @Get(path: '/{id}')
  Future<Response<Compartment>> readOne(
    @Path('id') String id,
  );
  
  @Get(path: '?filter={filter}')
  Future<Response<BuiltList<Compartment>>> readMany(@Path('filter') String filter);

  @Post()
  Future<Response<Compartment>> createOne(
    @Body() Compartment compartment,
  );

  @Put(path: '/{id}')
  Future<Response> updateOne(
    @Path('id') String id,
    @Body() Compartment compartment,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteOne(
    @Path('id') String id,
  );

  static CompartmentApiService create([ChopperClient client]) =>
      _$CompartmentApiService(client);
}
