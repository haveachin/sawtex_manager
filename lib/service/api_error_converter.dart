import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/api_error.dart';
import 'package:sawtex_manager/models/serializers.dart';

class ApiErrorConverter extends ErrorConverter {
  @override
  FutureOr<Response<ApiError>> convertError<BodyType, InnerType>(
      Response response) {
    ApiError body;

    try {
      body = serializers.deserializeWith<ApiError>(
          ApiError.serializer, jsonDecode(response.body));
    } on FormatException catch (e) {
      body = ApiError((b) => b
        ..status = response.statusCode
        ..message = '${response.statusCode}: ${e.message}'
        ..timestamp = DateTime.now().toUtc());
    }

    return Response<ApiError>(response.base, body);
  }
}
