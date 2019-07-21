library creditor;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'address.dart';
import 'serializers.dart';

part 'creditor.g.dart';

abstract class Creditor implements Built<Creditor, CreditorBuilder> {
  Address get address;
  String get name;

  Creditor._();

  factory Creditor([updates(CreditorBuilder b)]) = _$Creditor;

  String toJson() {
    return json.encode(serializers.serializeWith(Creditor.serializer, this));
  }

  static Creditor fromJson(String jsonString) {
    return serializers.deserializeWith(Creditor.serializer, json.decode(jsonString));
  }

  static Serializer<Creditor> get serializer => _$creditorSerializer;
}