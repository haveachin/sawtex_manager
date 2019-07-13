library api_error;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'api_error.g.dart';

abstract class ApiError implements Built<ApiError, ApiErrorBuilder> {
  int get status;
  String get message;
  int get timestamp;

  ApiError._();

  factory ApiError([updates(ApiErrorBuilder b)]) = _$ApiError;

  String toJson() {
    return json.encode(serializers.serializeWith(ApiError.serializer, this));
  }

  static ApiError fromJson(String jsonString) {
    return serializers.deserializeWith(ApiError.serializer, json.decode(jsonString));
  }

  static Serializer<ApiError> get serializer => _$apiErrorSerializer;
}