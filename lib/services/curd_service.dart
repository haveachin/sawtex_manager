import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/machine.dart';
import 'package:sawtex_manager/services/api_clients.dart';

import 'machine_api_service.dart';

abstract class CurdService<T> extends ChopperService {
  Future<Response<T>> createOne(T item);

  Future<Response> updateOne(String id, T item);

  Future<Response<T>> readOne(String id);

  Future<Response<Iterable<T>>> readMany();

  Future<Response> deleteOne(String id);

  static CurdService create<T>() {
    switch (T) {
      case Machine:
        return MachineApiService.create(ApiClients.authorized);
    }

    return null;
  }
}
