library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:sawtex_manager/models/machine.dart';

import 'api_error.dart';
import 'credentials.dart';
import 'token.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ApiError,
  Credentials,
  Machine,
  Token,
])

final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();