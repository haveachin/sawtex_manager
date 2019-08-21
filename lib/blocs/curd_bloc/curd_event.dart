import 'package:built_value/serializer.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/serializers.dart';

import 'curd_model.dart';

@immutable
abstract class CurdEvent extends Equatable {
  CurdEvent([List props = const []]) : super(props);
}

class AddOne<T extends CurdModel> extends CurdEvent {
  final T item;

  AddOne(this.item);

  factory AddOne.fromMap(Map<String, dynamic> map) {
    final T item = serializers.deserialize(map, specifiedType: FullType(T));
    return AddOne(item);
  }
}

class GetOne extends CurdEvent {
  final String id;

  GetOne(this.id);
}

class GetMany extends CurdEvent {}

class UpdateOne<T extends CurdModel> extends CurdEvent {
  final T item;

  UpdateOne(this.item);

  factory UpdateOne.fromMap(Map<String, dynamic> map) {
    final T item = serializers.deserialize(map, specifiedType: FullType(T));
    return UpdateOne(item);
  }
}

class DeleteOne extends CurdEvent {
  final String id;

  DeleteOne(this.id);
}