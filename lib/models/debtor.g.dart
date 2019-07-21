// GENERATED CODE - DO NOT MODIFY BY HAND

part of debtor;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Debtor> _$debtorSerializer = new _$DebtorSerializer();

class _$DebtorSerializer implements StructuredSerializer<Debtor> {
  @override
  final Iterable<Type> types = const [Debtor, _$Debtor];
  @override
  final String wireName = 'Debtor';

  @override
  Iterable serialize(Serializers serializers, Debtor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(Address)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'defaultPassword',
      serializers.serialize(object.defaultPassword,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Debtor deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DebtorBuilder();

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
        case 'defaultPassword':
          result.defaultPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Debtor extends Debtor {
  @override
  final Address address;
  @override
  final String name;
  @override
  final String defaultPassword;

  factory _$Debtor([void Function(DebtorBuilder) updates]) =>
      (new DebtorBuilder()..update(updates)).build();

  _$Debtor._({this.address, this.name, this.defaultPassword}) : super._() {
    if (address == null) {
      throw new BuiltValueNullFieldError('Debtor', 'address');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Debtor', 'name');
    }
    if (defaultPassword == null) {
      throw new BuiltValueNullFieldError('Debtor', 'defaultPassword');
    }
  }

  @override
  Debtor rebuild(void Function(DebtorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DebtorBuilder toBuilder() => new DebtorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Debtor &&
        address == other.address &&
        name == other.name &&
        defaultPassword == other.defaultPassword;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, address.hashCode), name.hashCode),
        defaultPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Debtor')
          ..add('address', address)
          ..add('name', name)
          ..add('defaultPassword', defaultPassword))
        .toString();
  }
}

class DebtorBuilder implements Builder<Debtor, DebtorBuilder> {
  _$Debtor _$v;

  AddressBuilder _address;
  AddressBuilder get address => _$this._address ??= new AddressBuilder();
  set address(AddressBuilder address) => _$this._address = address;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _defaultPassword;
  String get defaultPassword => _$this._defaultPassword;
  set defaultPassword(String defaultPassword) =>
      _$this._defaultPassword = defaultPassword;

  DebtorBuilder();

  DebtorBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address?.toBuilder();
      _name = _$v.name;
      _defaultPassword = _$v.defaultPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Debtor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Debtor;
  }

  @override
  void update(void Function(DebtorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Debtor build() {
    _$Debtor _$result;
    try {
      _$result = _$v ??
          new _$Debtor._(
              address: address.build(),
              name: name,
              defaultPassword: defaultPassword);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'address';
        address.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Debtor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
