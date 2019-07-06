import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/api_error.dart';

import 'bloc.dart';
import 'service.dart';

class BasicBloc<T> extends Bloc<BasicEvent, BasicState> {
  final ApiService<T> apiService;

  BasicBloc(this.apiService);
  
  @override
  BasicState get initialState => InitialBasicState();

  @override
  Stream<BasicState> mapEventToState(
    BasicEvent event,
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
      yield await _updateOne(event.id, event.item);
    } else if (event is DeleteOne) {
      yield DeletingOne();
      yield await _deleteOne(event.id);
    }
  }

  Future<BasicState> _addOne(T item) async {
    BasicState state;

    try {
      await apiService.postOne(item);
      state = AddedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<BasicState> _getOne(String id) async {
    BasicState state;

    try {
      final response = await apiService.getOne(id);
      state = LoadedOne(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<BasicState> _getMany() async {
    BasicState state;

    try {
      final response = await apiService.getMany();
      state = LoadedMany(response.body);
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<BasicState> _updateOne(String id, T item) async {
    BasicState state;

    try {
      await apiService.putOne(id, item);
      state = UpdatedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }

  Future<BasicState> _deleteOne(String id) async {
    BasicState state;

    try {
      await apiService.deleteOne(id);
      state = DeletedOne();
    } on Response<ApiError> catch (response) {
      state = ActionFailed(response.body);
    }

    return state;
  }
}
