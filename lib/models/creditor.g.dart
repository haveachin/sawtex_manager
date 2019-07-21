// GENERATED CODE - DO NOT MODIFY BY HAND

part of creditor;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Creditor> _$creditorSerializer = new _$CreditorSerializer();

class _$CreditorSerializer implements StructuredSerializer<Creditor> {
  @override
  final Iterable<Type> types = const [Creditor, _$Creditor];
  @override
  final String wireName = 'Creditor';

  @override
  Iterable serialize(Serializers serializers, Creditor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(Address)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Creditor deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreditorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'address':
          result.address.replace(serializers.deserialize(value,
              specifiedType: const FullType(Address)) as Address);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Creditor extends Creditor {
  @override
  final Address address;
  @override
  final String name;

  factory _$Creditor([void Function(CreditorBuilder) updates]) =>
      (new CreditorBuilder()..update(updates)).build();

  _$Creditor._({this.address, this.name}) : super._() {
    if (address == null) {
      throw new BuiltValueNullFieldError('Creditor', 'address');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Creditor', 'name');
    }
  }

  @override
  Creditor rebuild(void Function(CreditorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreditorBuilder toBuilder() => new CreditorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Creditor && address == other.address && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, address.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Creditor')
          ..add('address', address)
          ..add('name', name))
        .toString();
  }
}

class CreditorBuilder implements Builder<Creditor, CreditorBuilder> {
  _$Creditor _$v;

  AddressBuilder _address;
  AddressBuilder get address => _$this._address ??= new AddressBuilder();
  set address(AddressBuilder address) => _$this._address = address;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  CreditorBuilder();

  CreditorBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address?.toBuilder();
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Creditor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Creditor;
  }

  @override
  void update(void Function(CreditorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Creditor build() {
    _$Creditor _$result;
    try {
      _$result = _$v ?? new _$Creditor._(address: address.build(), name: name);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'address';
        address.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Creditor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
