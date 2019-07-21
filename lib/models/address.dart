library address;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'address.g.dart';

abstract class Address implements Built<Address, AddressBuilder> {
  String get cityId;
  String get street;
  int get houseNumber;

  Address._();

  factory Address([updates(AddressBuilder b)]) = _$Address;

  String toJson() {
    return json.encode(serializers.serializeWith(Address.serializer, this));
  }

  static Address fromJson(String jsonString) {
    return serializers.deserializeWith(Address.serializer, json.decode(jsonString));
  }

  static Serializer<Address> get serializer => _$addressSerializer;
}