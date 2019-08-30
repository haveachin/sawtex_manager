// GENERATED CODE - DO NOT MODIFY BY HAND

part of compartment;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Compartment> _$compartmentSerializer = new _$CompartmentSerializer();

class _$CompartmentSerializer implements StructuredSerializer<Compartment> {
  @override
  final Iterable<Type> types = const [Compartment, _$Compartment];
  @override
  final String wireName = 'Compartment';

  @override
  Iterable serialize(Serializers serializers, Compartment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'code',
      serializers.serialize(object.code,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.machineId != null) {
      result
        ..add('machineId')
        ..add(serializers.serialize(object.machineId,
            specifiedType: const FullType(String)));
    }
    if (object.clothingId != null) {
      result
        ..add('clothingId')
        ..add(serializers.serialize(object.clothingId,
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
    if (object.relay1 != null) {
      result
        ..add('relay1')
        ..add(serializers.serialize(object.relay1,
            specifiedType: const FullType(int)));
    }
    if (object.relay2 != null) {
      result
        ..add('relay2')
        ..add(serializers.serialize(object.relay2,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Compartment deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompartmentBuilder();

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
        case 'machineId':
          result.machineId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'clothingId':
          result.clothingId = serializers.deserialize(value,
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
        case 'code':
          result.code.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'relay1':
          result.relay1 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'relay2':
          result.relay2 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Compartment extends Compartment {
  @override
  final String id;
  @override
  final String machineId;
  @override
  final String clothingId;
  @override
  final DateTime updatedAt;
  @override
  final DateTime deletedAt;
  @override
  final String description;
  @override
  final BuiltList<int> code;
  @override
  final int relay1;
  @override
  final int relay2;

  factory _$Compartment([void Function(CompartmentBuilder) updates]) =>
      (new CompartmentBuilder()..update(updates)).build();

  _$Compartment._(
      {this.id,
      this.machineId,
      this.clothingId,
      this.updatedAt,
      this.deletedAt,
      this.description,
      this.code,
      this.relay1,
      this.relay2})
      : super._() {
    if (description == null) {
      throw new BuiltValueNullFieldError('Compartment', 'description');
    }
    if (code == null) {
      throw new BuiltValueNullFieldError('Compartment', 'code');
    }
  }

  @override
  Compartment rebuild(void Function(CompartmentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompartmentBuilder toBuilder() => new CompartmentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Compartment &&
        id == other.id &&
        machineId == other.machineId &&
        clothingId == other.clothingId &&
        updatedAt == other.updatedAt &&
        deletedAt == other.deletedAt &&
        description == other.description &&
        code == other.code &&
        relay1 == other.relay1 &&
        relay2 == other.relay2;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), machineId.hashCode),
                                clothingId.hashCode),
                            updatedAt.hashCode),
                        deletedAt.hashCode),
                    description.hashCode),
                code.hashCode),
            relay1.hashCode),
        relay2.hashCode));
  }
}

class CompartmentBuilder implements Builder<Compartment, CompartmentBuilder> {
  _$Compartment _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _machineId;
  String get machineId => _$this._machineId;
  set machineId(String machineId) => _$this._machineId = machineId;

  String _clothingId;
  String get clothingId => _$this._clothingId;
  set clothingId(String clothingId) => _$this._clothingId = clothingId;

  DateTime _updatedAt;
  DateTime get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime updatedAt) => _$this._updatedAt = updatedAt;

  DateTime _deletedAt;
  DateTime get deletedAt => _$this._deletedAt;
  set deletedAt(DateTime deletedAt) => _$this._deletedAt = deletedAt;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ListBuilder<int> _code;
  ListBuilder<int> get code => _$this._code ??= new ListBuilder<int>();
  set code(ListBuilder<int> code) => _$this._code = code;

  int _relay1;
  int get relay1 => _$this._relay1;
  set relay1(int relay1) => _$this._relay1 = relay1;

  int _relay2;
  int get relay2 => _$this._relay2;
  set relay2(int relay2) => _$this._relay2 = relay2;

  CompartmentBuilder();

  CompartmentBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _machineId = _$v.machineId;
      _clothingId = _$v.clothingId;
      _updatedAt = _$v.updatedAt;
      _deletedAt = _$v.deletedAt;
      _description = _$v.description;
      _code = _$v.code?.toBuilder();
      _relay1 = _$v.relay1;
      _relay2 = _$v.relay2;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Compartment other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Compartment;
  }

  @override
  void update(void Function(CompartmentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Compartment build() {
    _$Compartment _$result;
    try {
      _$result = _$v ??
          new _$Compartment._(
              id: id,
              machineId: machineId,
              clothingId: clothingId,
              updatedAt: updatedAt,
              deletedAt: deletedAt,
              description: description,
              code: code.build(),
              relay1: relay1,
              relay2: relay2);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'code';
        code.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Compartment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
