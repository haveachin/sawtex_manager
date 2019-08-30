library compartment;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';

import 'serializers.dart';

part 'compartment.g.dart';

abstract class Compartment implements Built<Compartment, CompartmentBuilder>, CurdModel {
  @nullable
  String get id;
  @nullable
  String get machineId;
  @nullable
  String get clothingId;
  @nullable
  DateTime get updatedAt;
  @nullable
  DateTime get deletedAt;
  String get description;
  BuiltList<int> get code;
  @nullable
  int get relay1;
  @nullable
  int get relay2;
  

  Compartment._();

  factory Compartment([updates(CompartmentBuilder b)]) = _$Compartment;

  String toJson() {
    return json.encode(serializers.serializeWith(Compartment.serializer, this));
  }

  static Compartment fromJson(String jsonString) {
    return serializers.deserializeWith(
        Compartment.serializer, json.decode(jsonString));
  }

  static Serializer<Compartment> get serializer => _$compartmentSerializer;
}
