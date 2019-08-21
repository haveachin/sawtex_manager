library machine;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';

import 'serializers.dart';

part 'machine.g.dart';

abstract class Machine implements Built<Machine, MachineBuilder>, CurdModel  {
  @nullable
  String get id;
  @nullable
  String get creditorId;
  @nullable
  String get debtorId;
  @nullable
  String get factoryId;
  @nullable
  DateTime get updatedAt;
  @nullable
  DateTime get deletedAt;
  String get description;
  String get ip;
  int get port;

  Machine._();

  factory Machine([updates(MachineBuilder b)]) = _$Machine;

  String toJson() {
    return json.encode(serializers.serializeWith(Machine.serializer, this));
  }

  static Machine fromJson(String jsonString) {
    return serializers.deserializeWith(Machine.serializer, json.decode(jsonString));
  }

  static Serializer<Machine> get serializer => _$machineSerializer;
}