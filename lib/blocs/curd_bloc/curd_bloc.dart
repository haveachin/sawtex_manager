import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/api_error.dart';
import 'package:sawtex_manager/services/curd_service.dart';

import 'bloc.dart';
import 'curd_model.dart';

class CurdBloc<T extends CurdModel> extends Bloc<CurdEvent, CurdState> {
  final CurdService<T> apiService;

  CurdBloc._(this.apiService);

  factory CurdBloc([CurdService<T> apiService]) =>
      CurdBloc._(apiService ?? CurdService.create<T>());

  @override
  CurdState get initialState => InitialState();

  @override
  Stream<CurdState> mapEventToState(
    CurdEvent event,
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

  Future<CurdState> _addOne(T item) async {
    CurdState state;

    try {
      await apiService.createOne(item);
      state = AddedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    } on Exception catch (_) {
      state = ActionFailed(ApiError.couldNotReach(apiService.client.baseUrl));
    }

    return state;
  }

  Future<CurdState> _getOne(String id) async {
    CurdState state;

    try {
      final response = await apiService.readOne(id);
      state = LoadedOne(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    } on Exception catch (_) {
      state = ActionFailed(ApiError.couldNotReach(apiService.client.baseUrl));
    }

    return state;
  }

  Future<CurdState> _getMany() async {
    CurdState state;

    try {
      final response = await apiService.readMany();
      state = LoadedMany(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    } on Exception catch (_) {
      state = ActionFailed(ApiError.couldNotReach(apiService.client.baseUrl));
    }

    return state;
  }

  Future<CurdState> _updateOne(T item) async {
    CurdState state;

    try {
      await apiService.updateOne(item.id, item);
      state = UpdatedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    } on Exception catch (_) {
      state = ActionFailed(ApiError.couldNotReach(apiService.client.baseUrl));
    }

    return state;
  }

  Future<CurdState> _deleteOne(String id) async {
    CurdState state;

    try {
      await apiService.deleteOne(id);
      state = DeletedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    } on Exception catch (_) {
      state = ActionFailed(ApiError.couldNotReach(apiService.client.baseUrl));
    }

    return state;
  }
}
