import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/api_error.dart';
import 'package:sawtex_manager/models/city.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/city_api_service.dart';

import './bloc.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final cityApiService = CityApiService.create(ApiClients.authorized);

  @override
  CityState get initialState => CityInitial();

  @override
  Stream<CityState> mapEventToState(
    CityEvent event,
  ) async* {
    if (event is AddCity) {
      yield AddingCity();
      yield await _addCity(event.city);
    } else if (event is GetCity) {
      yield LoadingCity();
      yield await _getCity(event.id);
    } else if (event is GetCities) {
      yield LoadingCities();
      yield await _getCities();
    } else if (event is UpdateCity) {
      yield UpdatingCity();
      yield await _updateCity(event.city);
    } else if (event is DeleteCity) {
      yield DeletingCity();
      yield await _deleteCity(event.id);
    }
  }

  Future<CityState> _addCity(City city) async {
    CityState state;

    try {
      final response = await cityApiService.postCity(city);
      state = CityAdded(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<CityState> _getCity(String id) async {
    CityState state;

    try {
      final response = await cityApiService.getCity(id);
      state = CityLoaded(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<CityState> _getCities() async {
    CityState state;

    try {
      final response = await cityApiService.getCities();
      state = CitiesLoaded(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<CityState> _updateCity(City city) async {
    CityState state;

    try {
      await cityApiService.putCity(city.id, city);
      state = CityUpdated(city);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<CityState> _deleteCity(String id) async {
    CityState state;

    try {
      await cityApiService.deleteCity(id);
      state = CityDeleted();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }
}
