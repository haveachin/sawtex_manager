import 'package:chopper/chopper.dart';

abstract class ApiService<T>  {
  Future<Response<T>> getOne(String id);

  Future<Response<Iterable<T>>> getMany();

  Future<Response<T>> postOne(T item);

  Future<Response> putOne(String id, T item);

  Future<Response> deleteOne(String id);
}
