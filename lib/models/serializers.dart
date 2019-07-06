library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:sawtex_manager/models/credentials.dart';
import 'package:sawtex_manager/models/token.dart';

import 'api_error.dart';
import 'city.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ApiError,
  City,
  Credentials,
  Token,
])

final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();