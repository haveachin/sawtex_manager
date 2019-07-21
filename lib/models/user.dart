library user;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sawtex_manager/widgets/manager/bloc/manager_model.dart';

import 'admin.dart';
import 'creditor.dart';
import 'debtor.dart';
import 'employee.dart';
import 'serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder>, ManagerModel {
  @nullable
  String get id;
  @nullable
  DateTime get updatedAt;
  @nullable
  DateTime get deletedAt;
  @nullable
  Admin get admin;
  @nullable
  Creditor get creditor;
  @nullable
  Debtor get debtor;
  @nullable
  Employee get employee;
  String get username;
  @nullable
  String get password;
  String get email;

  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(User.serializer, json.decode(jsonString));
  }

  static Serializer<User> get serializer => _$userSerializer;
}