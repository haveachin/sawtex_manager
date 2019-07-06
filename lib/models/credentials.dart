library credentials;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'credentials.g.dart';

abstract class Credentials implements Built<Credentials, CredentialsBuilder> {
  String get username;
  String get password;

  Credentials._();

  factory Credentials([updates(CredentialsBuilder b)]) = _$Credentials;

  String toJson() {
    return json.encode(serializers.serializeWith(Credentials.serializer, this));
  }

  static Credentials fromJson(String jsonString) {
    return serializers.deserializeWith(Credentials.serializer, json.decode(jsonString));
  }

  static Serializer<Credentials> get serializer => _$credentialsSerializer;
}