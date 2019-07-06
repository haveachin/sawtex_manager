import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/serializers.dart';

@immutable
abstract class BasicEvent extends Equatable {
  BasicEvent([List props = const []]) : super(props);
}

class AddOne<T> extends BasicEvent {
  final T item;

  AddOne(this.item);

  factory AddOne.fromMap(Map<String, dynamic> map) {
    final item = serializers.deserialize(map);
    return AddOne(item);
  }
}

class GetOne extends BasicEvent {
  final String id;

  GetOne(this.id);
}

class GetMany extends BasicEvent {}

class UpdateOne<T> extends BasicEvent {
  final String id;
  final T item;

  UpdateOne(this.id, this.item);

  factory UpdateOne.fromMap(String id, Map<String, dynamic> map) {
    final item = serializers.deserialize(map);
    return UpdateOne(id, item);
  }
}

class DeleteOne extends BasicEvent {
  final String id;

  DeleteOne(this.id);
}