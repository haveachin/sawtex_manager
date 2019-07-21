library size_choice;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sawtex_manager/widgets/manager/bloc/manager_model.dart';

import 'serializers.dart';

part 'size_choice.g.dart';

abstract class SizeChoice implements Built<SizeChoice, SizeChoiceBuilder>, ManagerModel {
  @nullable
  String get id;
  @nullable
  DateTime get updatedAt;
  @nullable
  DateTime get deletedAt;
  String get description;

  SizeChoice._();

  factory SizeChoice([updates(SizeChoiceBuilder b)]) = _$SizeChoice;

  String toJson() {
    return json.encode(serializers.serializeWith(SizeChoice.serializer, this));
  }

  static SizeChoice fromJson(String jsonString) {
    return serializers.deserializeWith(SizeChoice.serializer, json.decode(jsonString));
  }

  static Serializer<SizeChoice> get serializer => _$sizeChoiceSerializer;
}