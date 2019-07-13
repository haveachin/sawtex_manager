import 'package:built_value/serializer.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/serializers.dart';

import 'manager_model.dart';

@immutable
abstract class ManagerEvent extends Equatable {
  ManagerEvent([List props = const []]) : super(props);
}

class AddOne<T extends ManagerModel> extends ManagerEvent {
  final T item;

  AddOne(this.item);

  factory AddOne.fromMap(Map<String, dynamic> map) {
    final T item = serializers.deserialize(map, specifiedType: FullType(T));
    return AddOne(item);
  }
}

class GetOne extends ManagerEvent {
  final String id;

  GetOne(this.id);
}

class GetMany extends ManagerEvent {}

class UpdateOne<T extends ManagerModel> extends ManagerEvent {
  final T item;

  UpdateOne(this.item);

  factory UpdateOne.fromMap(Map<String, dynamic> map) {
    final T item = serializers.deserialize(map, specifiedType: FullType(T));
    return UpdateOne(item);
  }
}

class DeleteOne extends ManagerEvent {
  final String id;

  DeleteOne(this.id);
}