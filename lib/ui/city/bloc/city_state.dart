import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/api_error.dart';
import 'package:sawtex_manager/models/city.dart';

@immutable
abstract class CityState extends Equatable {
  CityState([List props = const []]) : super(props);
}

class CityInitial extends CityState {}

class AddingCity extends CityState {}

class CityAdded extends CityState {
  final City city;

  CityAdded(this.city);
}

class LoadingCity extends CityState {}

class CityLoaded extends CityState {
  final City city;

  CityLoaded(this.city);
}

class LoadingCities extends CityState {}

class CitiesLoaded extends CityState {
  final BuiltList<City> cities;

  CitiesLoaded(this.cities);
}

class ActionFailed extends CityState {
  final ApiError error;

  ActionFailed(this.error) : super([error]);
}

class UpdatingCity extends CityState {}

class CityUpdated extends CityState {
  final City city;

  CityUpdated(this.city);
}

class DeletingCity extends CityState {}

class CityDeleted extends CityState {}