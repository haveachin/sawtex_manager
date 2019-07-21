import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/size_choice.dart';
import 'package:sawtex_manager/widgets/manager/bloc/service.dart';

part 'size_choice_api_service.chopper.dart';

@ChopperApi(baseUrl: '/size-choices')
abstract class SizeChoiceApiService extends ChopperService implements ApiService<SizeChoice> {
  @Get(path: '/{id}')
  Future<Response<SizeChoice>> getOne(
    @Path('id') String id,
  );
  
  @Get()
  Future<Response<BuiltList<SizeChoice>>> getMany();

  @Post()
  Future<Response<SizeChoice>> postOne(
    @Body() SizeChoice sizeChoice,
  );

  @Put(path: '/{id}')
  Future<Response> putOne(
    @Path('id') String id,
    @Body() SizeChoice sizeChoice,
  );

  @Delete(path: '/{id}')
  Future<Response> deleteOne(
    @Path('id') String id,
  );

  static SizeChoiceApiService create([ChopperClient client]) =>
      _$SizeChoiceApiService(client);
}
