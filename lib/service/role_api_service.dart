import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/role.dart';
import 'package:sawtex_manager/widgets/manager/bloc/service.dart';

part 'role_api_service.chopper.dart';

@ChopperApi(baseUrl: '/roles')
abstract class RoleApiService extends ChopperService implements ApiService<Role> {
  @Get(path: '/{id}')
  Future<Response<Role>> getOne(
    @Path('id') String id,
  );
  
  @Get()
  Future<Response<BuiltList<Role>>> getMany();

  @Post()
  Future<Response<Role>> postOne(
    @Body() Role role,
  );

  @Put(path: '/{id}')
  Future<Response> putOne(
    @Path('id') String id,
    @Body() Role role,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteOne(
    @Path('id') String id,
  );

  static RoleApiService create([ChopperClient client]) =>
      _$RoleApiService(client);
}
