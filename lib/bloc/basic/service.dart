import 'package:chopper/chopper.dart';

abstract class ApiService<T> extends ChopperService {
  Future<Response<T>> getOne(String id);

  Future<Response<Iterable<T>>> getMany();

  Future<Response<T>> postOne(T city);

  Future<Response> putOne(String id, T city);

  Future<Response> deleteOne(String id);
}
