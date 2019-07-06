// GENERATED CODE - DO NOT MODIFY BY HAND

part of api_error;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiError> _$apiErrorSerializer = new _$ApiErrorSerializer();

class _$ApiErrorSerializer implements StructuredSerializer<ApiError> {
  @override
  final Iterable<Type> types = const [ApiError, _$ApiError];
  @override
  final String wireName = 'ApiError';

  @override
  Iterable serialize(Serializers serializers, ApiError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
      'error',
      serializers.serialize(object.error,
          specifiedType: const FullType(String)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ApiError deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiError extends ApiError {
  @override
  final int status;
  @override
  final String error;
  @override
  final int timestamp;

  factory _$ApiError([void Function(ApiErrorBuilder) updates]) =>
      (new ApiErrorBuilder()..update(updates)).build();

  _$ApiError._({this.status, this.error, this.timestamp}) : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('ApiError', 'status');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('ApiError', 'error');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('ApiError', 'timestamp');
    }
  }

  @override
  ApiError rebuild(void Function(ApiErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiErrorBuilder toBuilder() => new ApiErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiError &&
        status == other.status &&
        error == other.error &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, status.hashCode), error.hashCode), timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ApiError')
          ..add('status', status)
          ..add('error', error)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class ApiErrorBuilder implements Builder<ApiError, ApiErrorBuilder> {
  _$ApiError _$v;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  int _timestamp;
  int get timestamp => _$this._timestamp;
  set timestamp(int timestamp) => _$this._timestamp = timestamp;

  ApiErrorBuilder();

  ApiErrorBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _error = _$v.error;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ApiError;
  }

  @override
  void update(void Function(ApiErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ApiError build() {
    final _$result = _$v ??
        new _$ApiError._(status: status, error: error, timestamp: timestamp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
