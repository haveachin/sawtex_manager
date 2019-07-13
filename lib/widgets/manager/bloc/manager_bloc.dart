import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/api_error.dart';

import 'bloc.dart';
import 'manager_model.dart';
import 'service.dart';

class ManagerBloc<T extends ManagerModel> extends Bloc<ManagerEvent, ManagerState> {
  final ApiService<T> apiService;

  ManagerBloc(this.apiService);
  
  @override
  ManagerState get initialState => InitialBasicState();

  @override
  Stream<ManagerState> mapEventToState(
    ManagerEvent event,
  ) async* {
    if (event is AddOne) {
      yield AddingOne();
      yield await _addOne(event.item);
    } else if (event is GetOne) {
      yield LoadingOne();
      yield await _getOne(event.id);
    } else if (event is GetMany) {
      yield LoadingMany();
      yield await _getMany();
    } else if (event is UpdateOne) {
      yield UpdatingOne();
      yield await _updateOne(event.item);
    } else if (event is DeleteOne) {
      yield DeletingOne();
      yield await _deleteOne(event.id);
    }
  }

  Future<ManagerState> _addOne(T item) async {
    ManagerState state;

    try {
      await apiService.postOne(item);
      state = AddedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<ManagerState> _getOne(String id) async {
    ManagerState state;

    try {
      final response = await apiService.getOne(id);
      state = LoadedOne(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<ManagerState> _getMany() async {
    ManagerState state;

    try {
      final response = await apiService.getMany();
      state = LoadedMany(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<ManagerState> _updateOne(T item) async {
    ManagerState state;

    try {
      await apiService.putOne(item.id, item);
      state = UpdatedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<ManagerState> _deleteOne(String id) async {
    ManagerState state;

    try {
      await apiService.deleteOne(id);
      state = DeletedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }
}
