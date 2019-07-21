library admin;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'address.dart';
import 'serializers.dart';

part 'admin.g.dart';

abstract class Admin implements Built<Admin, AdminBuilder> {
  @nullable
  Address get address;

  Admin._();

  factory Admin([updates(AdminBuilder b)]) = _$Admin;

  String toJson() {
    return json.encode(serializers.serializeWith(Admin.serializer, this));
  }

  static Admin fromJson(String jsonString) {
    return serializers.deserializeWith(Admin.serializer, json.decode(jsonString));
  }

  static Serializer<Admin> get serializer => _$adminSerializer;
}