import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/user.dart';
import 'package:sawtex_manager/widgets/manager/bloc/service.dart';

part 'user_api_service.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class UserApiService extends ChopperService implements ApiService<User> {
  @Get(path: '/{id}')
  Future<Response<User>> getOne(
    @Path('id') String id,
  );
  
  @Get()
  Future<Response<BuiltList<User>>> getMany();

  @Post()
  Future<Response<User>> postOne(
    @Body() User user,
  );

  @Put(path: '/{id}')
  Future<Response> putOne(
    @Path('id') String id,
    @Body() User user,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteOne(
    @Path('id') String id,
  );

  static UserApiService create([ChopperClient client]) =>
      _$UserApiService(client);
}
