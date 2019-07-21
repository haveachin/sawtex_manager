library debtor;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'address.dart';
import 'serializers.dart';

part 'debtor.g.dart';

abstract class Debtor implements Built<Debtor, DebtorBuilder> {
  Address get address;
  String get name;
  String get defaultPassword;

  Debtor._();

  factory Debtor([updates(DebtorBuilder b)]) = _$Debtor;

  String toJson() {
    return json.encode(serializers.serializeWith(Debtor.serializer, this));
  }

  static Debtor fromJson(String jsonString) {
    return serializers.deserializeWith(Debtor.serializer, json.decode(jsonString));
  }

  static Serializer<Debtor> get serializer => _$debtorSerializer;
}