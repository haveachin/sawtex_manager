library city;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sawtex_manager/widgets/manager/bloc/manager_model.dart';

import 'serializers.dart';

part 'city.g.dart';

abstract class City implements Built<City, CityBuilder>, ManagerModel  {
  @nullable
  String get id;
  String get name;
  String get zipCode;
  String get country;
  String get countryCode;
  String get state;

  City._();

  factory City([updates(CityBuilder b)]) = _$City;

  String toJson() {
    return json.encode(serializers.serializeWith(City.serializer, this));
  }

  static City fromJson(String jsonString) {
    return serializers.deserializeWith(City.serializer, json.decode(jsonString));
  }

  static Serializer<City> get serializer => _$citySerializer;
}