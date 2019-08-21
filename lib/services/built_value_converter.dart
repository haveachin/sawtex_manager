import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:sawtex_manager/models/api_error.dart';

import 'package:sawtex_manager/models/serializers.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) => super.convertRequest(
        request.replace(
          body: serializers.serializeWith(
              serializers.serializerForType(request.body.runtimeType),
              request.body),
        ),
      );

  @override
  Response<BodyType> convertResponse<BodyType, SingleItemType>(
      Response response) {
    final Response dynamicResponse = super.convertResponse(response);
    final BodyType customBody =
        _convertToCustomObject<SingleItemType>(dynamicResponse.body);
    return dynamicResponse.replace<BodyType>(body: customBody);
  }

  @override
  Response<ApiError> convertError<BodyType, SingleItemType>(Response response) {
    final Response dynamicResponse = super.convertResponse(response);
    final ApiError customBody =
        _convertToCustomObject<ApiError>(dynamicResponse.body);
    return dynamicResponse.replace<ApiError>(body: customBody);
  }

  dynamic _convertToCustomObject<SingleItemType>(dynamic element) {
    if (element is SingleItemType) return element;

    try {
      if (element is Iterable) return _deserializeListOf<SingleItemType>(element);
      return _deserialize<SingleItemType>(element);
    } catch (e) {
      print(e);
    }
  }

  BuiltList<SingleItemType> _deserializeListOf<SingleItemType>(
      Iterable dynamicIterable) {
    return BuiltList<SingleItemType>(
      dynamicIterable
          .map((dynamicIterable) =>
              _deserialize<SingleItemType>(dynamicIterable))
          .toList(growable: false),
    );
  }

  SingleItemType _deserialize<SingleItemType>(Map<String, dynamic> value) {
    return serializers.deserializeWith(
      serializers.serializerForType(SingleItemType),
      value,
    );
  }
}
