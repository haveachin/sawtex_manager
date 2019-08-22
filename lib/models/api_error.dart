library api_error;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';

import 'serializers.dart';

part 'api_error.g.dart';

abstract class ApiError implements Built<ApiError, ApiErrorBuilder> {
  int get status;
  String get message;
  DateTime get timestamp;

  ApiError._();

  factory ApiError([updates(ApiErrorBuilder b)]) = _$ApiError;

  factory ApiError.couldNotReach(ChopperService service) {
    return ApiError(
      (b) => b
        ..status = 503
        ..timestamp = DateTime.now().toUtc()
        ..message = "Could not reach ${service.client.baseUrl}.",
    );
  }

  static final ApiError unkownResponse = ApiError(
    (b) => b
      ..status = 406
      ..message = "Unknown response object, deserialization failed"
      ..timestamp = DateTime.now().toUtc(),
  );

  String toJson() {
    return json.encode(serializers.serializeWith(ApiError.serializer, this));
  }

  static ApiError fromJson(String jsonString) {
    return serializers.deserializeWith(
        ApiError.serializer, json.decode(jsonString));
  }

  static Serializer<ApiError> get serializer => _$apiErrorSerializer;
}
