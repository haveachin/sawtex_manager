import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/api_error.dart';

@immutable
abstract class ManagerState extends Equatable {
  ManagerState([List props = const []]) : super(props);
}

class InitialState extends ManagerState {}

class AddingOne extends ManagerState {}

class AddedOne extends ManagerState {}

class LoadingOne extends ManagerState {}

class LoadedOne<T> extends ManagerState {
  final T item;

  LoadedOne(this.item);
}

class LoadingMany extends ManagerState {}

class LoadedMany<T> extends ManagerState {
  final Iterable<T> items;

  LoadedMany(this.items);
}

class UpdatingOne extends ManagerState {}

class UpdatedOne extends ManagerState {}

class DeletingOne extends ManagerState {}

class DeletedOne extends ManagerState {}

class ActionFailed extends ManagerState {
  final ApiError error;

  ActionFailed(this.error) : super([error]);
}
