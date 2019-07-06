import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sawtex_manager/models/city.dart';
import 'package:sawtex_manager/models/serializers.dart';

@immutable
abstract class CityEvent extends Equatable {
  CityEvent([List props = const []]) : super(props);
}

class AddCity extends CityEvent {
  final City city;

  AddCity(this.city);

  factory AddCity.fromMap(Map<String, dynamic> map) {
    final city = serializers.deserializeWith(City.serializer, map);
    return AddCity(city);
  }
}

class GetCity extends CityEvent {
  final String id;

  GetCity(this.id);
}

class GetCities extends CityEvent {}

class UpdateCity extends CityEvent {
  final City city;

  UpdateCity(this.city);

  factory UpdateCity.fromMap(Map<String, dynamic> map) {
    final city = serializers.deserializeWith(City.serializer, map);
    return UpdateCity(city);
  }
}

class DeleteCity extends CityEvent {
  final String id;

  DeleteCity(this.id);
}