// GENERATED CODE - DO NOT MODIFY BY HAND

part of role;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Role> _$roleSerializer = new _$RoleSerializer();

class _$RoleSerializer implements StructuredSerializer<Role> {
  @override
  final Iterable<Type> types = const [Role, _$Role];
  @override
  final String wireName = 'Role';

  @override
  Iterable serialize(Serializers serializers, Role object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
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
  Role deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoleBuilder();

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
      }
    }

    return result.build();
  }
}

class _$Role extends Role {
  @override
  final String id;
  @override
  final DateTime updatedAt;
  @override
  final DateTime deletedAt;
  @override
  final String description;

  factory _$Role([void Function(RoleBuilder) updates]) =>
      (new RoleBuilder()..update(updates)).build();

  _$Role._({this.id, this.updatedAt, this.deletedAt, this.description})
      : super._() {
    if (description == null) {
      throw new BuiltValueNullFieldError('Role', 'description');
    }
  }

  @override
  Role rebuild(void Function(RoleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoleBuilder toBuilder() => new RoleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Role &&
        id == other.id &&
        updatedAt == other.updatedAt &&
        deletedAt == other.deletedAt &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), updatedAt.hashCode), deletedAt.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Role')
          ..add('id', id)
          ..add('updatedAt', updatedAt)
          ..add('deletedAt', deletedAt)
          ..add('description', description))
        .toString();
  }
}

class RoleBuilder implements Builder<Role, RoleBuilder> {
  _$Role _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DateTime _updatedAt;
  DateTime get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime updatedAt) => _$this._updatedAt = updatedAt;

  DateTime _deletedAt;
  DateTime get deletedAt => _$this._deletedAt;
  set deletedAt(DateTime deletedAt) => _$this._deletedAt = deletedAt;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  RoleBuilder();

  RoleBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _updatedAt = _$v.updatedAt;
      _deletedAt = _$v.deletedAt;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Role other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Role;
  }

  @override
  void update(void Function(RoleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Role build() {
    final _$result = _$v ??
        new _$Role._(
            id: id,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
