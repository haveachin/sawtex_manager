// GENERATED CODE - DO NOT MODIFY BY HAND

part of machine;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Machine> _$machineSerializer = new _$MachineSerializer();

class _$MachineSerializer implements StructuredSerializer<Machine> {
  @override
  final Iterable<Type> types = const [Machine, _$Machine];
  @override
  final String wireName = 'Machine';

  @override
  Iterable serialize(Serializers serializers, Machine object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'ip',
      serializers.serialize(object.ip, specifiedType: const FullType(String)),
      'port',
      serializers.serialize(object.port, specifiedType: const FullType(int)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.creditorId != null) {
      result
        ..add('creditorId')
        ..add(serializers.serialize(object.creditorId,
            specifiedType: const FullType(String)));
    }
    if (object.debtorId != null) {
      result
        ..add('debtorId')
        ..add(serializers.serialize(object.debtorId,
            specifiedType: const FullType(String)));
    }
    if (object.factoryId != null) {
      result
        ..add('factoryId')
        ..add(serializers.serialize(object.factoryId,
            specifiedType: const FullType(String)));
    }
    if (object.updatedAt != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(DateTime)));
    }
    if (object.deletedAt != null) {
      result
        ..add('deletedAt')
        ..add(serializers.serialize(object.deletedAt,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  Machine deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MachineBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'creditorId':
          result.creditorId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'debtorId':
          result.debtorId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'factoryId':
          result.factoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'deletedAt':
          result.deletedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ip':
          result.ip = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'port':
          result.port = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Machine extends Machine {
  @override
  final String id;
  @override
  final String creditorId;
  @override
  final String debtorId;
  @override
  final String factoryId;
  @override
  final DateTime updatedAt;
  @override
  final DateTime deletedAt;
  @override
  final String description;
  @override
  final String ip;
  @override
  final int port;

  factory _$Machine([void Function(MachineBuilder) updates]) =>
      (new MachineBuilder()..update(updates)).build();

  _$Machine._(
      {this.id,
      this.creditorId,
      this.debtorId,
      this.factoryId,
      this.updatedAt,
      this.deletedAt,
      this.description,
      this.ip,
      this.port})
      : super._() {
    if (description == null) {
      throw new BuiltValueNullFieldError('Machine', 'description');
    }
    if (ip == null) {
      throw new BuiltValueNullFieldError('Machine', 'ip');
    }
    if (port == null) {
      throw new BuiltValueNullFieldError('Machine', 'port');
    }
  }

  @override
  Machine rebuild(void Function(MachineBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MachineBuilder toBuilder() => new MachineBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Machine &&
        id == other.id &&
        creditorId == other.creditorId &&
        debtorId == other.debtorId &&
        factoryId == other.factoryId &&
        updatedAt == other.updatedAt &&
        deletedAt == other.deletedAt &&
        description == other.description &&
        ip == other.ip &&
        port == other.port;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), creditorId.hashCode),
                                debtorId.hashCode),
                            factoryId.hashCode),
                        updatedAt.hashCode),
                    deletedAt.hashCode),
                description.hashCode),
            ip.hashCode),
        port.hashCode));
  }
}

class MachineBuilder implements Builder<Machine, MachineBuilder> {
  _$Machine _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _creditorId;
  String get creditorId => _$this._creditorId;
  set creditorId(String creditorId) => _$this._creditorId = creditorId;

  String _debtorId;
  String get debtorId => _$this._debtorId;
  set debtorId(String debtorId) => _$this._debtorId = debtorId;

  String _factoryId;
  String get factoryId => _$this._factoryId;
  set factoryId(String factoryId) => _$this._factoryId = factoryId;

  DateTime _updatedAt;
  DateTime get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime updatedAt) => _$this._updatedAt = updatedAt;

  DateTime _deletedAt;
  DateTime get deletedAt => _$this._deletedAt;
  set deletedAt(DateTime deletedAt) => _$this._deletedAt = deletedAt;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _ip;
  String get ip => _$this._ip;
  set ip(String ip) => _$this._ip = ip;

  int _port;
  int get port => _$this._port;
  set port(int port) => _$this._port = port;

  MachineBuilder();

  MachineBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _creditorId = _$v.creditorId;
      _debtorId = _$v.debtorId;
      _factoryId = _$v.factoryId;
      _updatedAt = _$v.updatedAt;
      _deletedAt = _$v.deletedAt;
      _description = _$v.description;
      _ip = _$v.ip;
      _port = _$v.port;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Machine other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Machine;
  }

  @override
  void update(void Function(MachineBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Machine build() {
    final _$result = _$v ??
        new _$Machine._(
            id: id,
            creditorId: creditorId,
            debtorId: debtorId,
            factoryId: factoryId,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            description: description,
            ip: ip,
            port: port);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
