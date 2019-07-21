// GENERATED CODE - DO NOT MODIFY BY HAND

part of size_choice;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SizeChoice> _$sizeChoiceSerializer = new _$SizeChoiceSerializer();

class _$SizeChoiceSerializer implements StructuredSerializer<SizeChoice> {
  @override
  final Iterable<Type> types = const [SizeChoice, _$SizeChoice];
  @override
  final String wireName = 'SizeChoice';

  @override
  Iterable serialize(Serializers serializers, SizeChoice object,
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
  SizeChoice deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SizeChoiceBuilder();

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

class _$SizeChoice extends SizeChoice {
  @override
  final String id;
  @override
  final DateTime updatedAt;
  @override
  final DateTime deletedAt;
  @override
  final String description;

  factory _$SizeChoice([void Function(SizeChoiceBuilder) updates]) =>
      (new SizeChoiceBuilder()..update(updates)).build();

  _$SizeChoice._({this.id, this.updatedAt, this.deletedAt, this.description})
      : super._() {
    if (description == null) {
      throw new BuiltValueNullFieldError('SizeChoice', 'description');
    }
  }

  @override
  SizeChoice rebuild(void Function(SizeChoiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SizeChoiceBuilder toBuilder() => new SizeChoiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SizeChoice &&
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
    return (newBuiltValueToStringHelper('SizeChoice')
          ..add('id', id)
          ..add('updatedAt', updatedAt)
          ..add('deletedAt', deletedAt)
          ..add('description', description))
        .toString();
  }
}

class SizeChoiceBuilder implements Builder<SizeChoice, SizeChoiceBuilder> {
  _$SizeChoice _$v;

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

  SizeChoiceBuilder();

  SizeChoiceBuilder get _$this {
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
  void replace(SizeChoice other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SizeChoice;
  }

  @override
  void update(void Function(SizeChoiceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SizeChoice build() {
    final _$result = _$v ??
        new _$SizeChoice._(
            id: id,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
