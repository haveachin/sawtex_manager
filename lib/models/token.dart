library token;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'token.g.dart';

abstract class Token implements Built<Token, TokenBuilder> {
  String get token;
  @nullable
  int get expiresAt;

  static const String secureStorageKey = 'sawtex_api_token';

  Token._();

  factory Token([updates(TokenBuilder b)]) = _$Token;

  String toJson() {
    return json.encode(serializers.serializeWith(Token.serializer, this));
  }

  static Token fromJson(String jsonString) {
    return serializers.deserializeWith(Token.serializer, json.decode(jsonString));
  }

  static Serializer<Token> get serializer => _$tokenSerializer;
}