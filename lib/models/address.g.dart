// GENERATED CODE - DO NOT MODIFY BY HAND

part of address;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Address> _$addressSerializer = new _$AddressSerializer();

class _$AddressSerializer implements StructuredSerializer<Address> {
  @override
  final Iterable<Type> types = const [Address, _$Address];
  @override
  final String wireName = 'Address';

  @override
  Iterable serialize(Serializers serializers, Address object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'cityId',
      serializers.serialize(object.cityId,
          specifiedType: const FullType(String)),
      'street',
      serializers.serialize(object.street,
          specifiedType: const FullType(String)),
      'houseNumber',
      serializers.serialize(object.houseNumber,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Address deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'cityId':
          result.cityId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'street':
          result.street = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'houseNumber':
          result.houseNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Address extends Address {
  @override
  final String cityId;
  @override
  final String street;
  @override
  final int houseNumber;

  factory _$Address([void Function(AddressBuilder) updates]) =>
      (new AddressBuilder()..update(updates)).build();

  _$Address._({this.cityId, this.street, this.houseNumber}) : super._() {
    if (cityId == null) {
      throw new BuiltValueNullFieldError('Address', 'cityId');
    }
    if (street == null) {
      throw new BuiltValueNullFieldError('Address', 'street');
    }
    if (houseNumber == null) {
      throw new BuiltValueNullFieldError('Address', 'houseNumber');
    }
  }

  @override
  Address rebuild(void Function(AddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressBuilder toBuilder() => new AddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
        cityId == other.cityId &&
        street == other.street &&
        houseNumber == other.houseNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, cityId.hashCode), street.hashCode), houseNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Address')
          ..add('cityId', cityId)
          ..add('street', street)
          ..add('houseNumber', houseNumber))
        .toString();
  }
}

class AddressBuilder implements Builder<Address, AddressBuilder> {
  _$Address _$v;

  String _cityId;
  String get cityId => _$this._cityId;
  set cityId(String cityId) => _$this._cityId = cityId;

  String _street;
  String get street => _$this._street;
  set street(String street) => _$this._street = street;

  int _houseNumber;
  int get houseNumber => _$this._houseNumber;
  set houseNumber(int houseNumber) => _$this._houseNumber = houseNumber;

  AddressBuilder();

  AddressBuilder get _$this {
    if (_$v != null) {
      _cityId = _$v.cityId;
      _street = _$v.street;
      _houseNumber = _$v.houseNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Address other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Address;
  }

  @override
  void update(void Function(AddressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Address build() {
    final _$result = _$v ??
        new _$Address._(
            cityId: cityId, street: street, houseNumber: houseNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
