import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/machine.dart';

import 'curd_service.dart';

part 'machine_api_service.chopper.dart';

@ChopperApi(baseUrl: '/machines')
abstract class MachineApiService extends ChopperService implements CurdService<Machine> {
  @Get(path: '/{id}')
  Future<Response<Machine>> readOne(
    @Path('id') String id,
  );
  
  @Get()
  Future<Response<BuiltList<Machine>>> readMany();

  @Post()
  Future<Response<Machine>> createOne(
    @Body() Machine machine,
  );

  @Put(path: '/{id}')
  Future<Response> updateOne(
    @Path('id') String id,
    @Body() Machine machine,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteOne(
    @Path('id') String id,
  );

  static MachineApiService create([ChopperClient client]) =>
      _$MachineApiService(client);
}
