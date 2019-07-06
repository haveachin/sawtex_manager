import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/api_error.dart';

@immutable
abstract class BasicState extends Equatable {
  BasicState([List props = const []]) : super(props);
}

class InitialBasicState extends BasicState {}

class AddingOne extends BasicState {}

class AddedOne extends BasicState {}

class LoadingOne extends BasicState {}

class LoadedOne<T> extends BasicState {
  final T item;

  LoadedOne(this.item);
}

class LoadingMany extends BasicState {}

class LoadedMany<T> extends BasicState {
  final Iterable<T> items;

  LoadedMany(this.items);
}

class UpdatingOne extends BasicState {}

class UpdatedOne extends BasicState {}

class DeletingOne extends BasicState {}

class DeletedOne extends BasicState {}

class ActionFailed extends BasicState {
  final ApiError error;

  ActionFailed(this.error) : super([error]);
}
