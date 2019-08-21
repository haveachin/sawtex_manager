import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/api_error.dart';

@immutable
abstract class CurdState extends Equatable {
  CurdState([List props = const []]) : super(props);
}

class InitialState extends CurdState {}

class AddingOne extends CurdState {}

class AddedOne extends CurdState {}

class LoadingOne extends CurdState {}

class LoadedOne<T> extends CurdState {
  final T item;

  LoadedOne(this.item);
}

class LoadingMany extends CurdState {}

class LoadedMany<T> extends CurdState {
  final Iterable<T> items;

  LoadedMany(this.items);
}

class UpdatingOne extends CurdState {}

class UpdatedOne extends CurdState {}

class DeletingOne extends CurdState {}

class DeletedOne extends CurdState {}

class ActionFailed extends CurdState {
  final ApiError error;

  ActionFailed(this.error) : super([error]);
}
