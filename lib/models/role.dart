library role;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sawtex_manager/widgets/manager/bloc/manager_model.dart';

import 'serializers.dart';

part 'role.g.dart';

abstract class Role implements Built<Role, RoleBuilder>, ManagerModel {
  @nullable
  String get id;
  @nullable
  DateTime get updatedAt;
  @nullable
  DateTime get deletedAt;
  String get description;

  Role._();

  factory Role([updates(RoleBuilder b)]) = _$Role;

  String toJson() {
    return json.encode(serializers.serializeWith(Role.serializer, this));
  }

  static Role fromJson(String jsonString) {
    return serializers.deserializeWith(Role.serializer, json.decode(jsonString));
  }

  static Serializer<Role> get serializer => _$roleSerializer;
}