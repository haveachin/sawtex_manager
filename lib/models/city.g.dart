// GENERATED CODE - DO NOT MODIFY BY HAND

part of city;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<City> _$citySerializer = new _$CitySerializer();

class _$CitySerializer implements StructuredSerializer<City> {
  @override
  final Iterable<Type> types = const [City, _$City];
  @override
  final String wireName = 'City';

  @override
  Iterable serialize(Serializers serializers, City object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'zipCode',
      serializers.serialize(object.zipCode,
          specifiedType: const FullType(String)),
      'country',
      serializers.serialize(object.country,
          specifiedType: const FullType(String)),
      'countryCode',
      serializers.serialize(object.countryCode,
          specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  City deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CityBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'zipCode':
          result.zipCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'countryCode':
          result.countryCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$City extends City {
  @override
  final String id;
  @override
  final String name;
  @override
  final String zipCode;
  @override
  final String country;
  @override
  final String countryCode;
  @override
  final String state;

  factory _$City([void Function(CityBuilder) updates]) =>
      (new CityBuilder()..update(updates)).build();

  _$City._(
      {this.id,
      this.name,
      this.zipCode,
      this.country,
      this.countryCode,
      this.state})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('City', 'name');
    }
    if (zipCode == null) {
      throw new BuiltValueNullFieldError('City', 'zipCode');
    }
    if (country == null) {
      throw new BuiltValueNullFieldError('City', 'country');
    }
    if (countryCode == null) {
      throw new BuiltValueNullFieldError('City', 'countryCode');
    }
    if (state == null) {
      throw new BuiltValueNullFieldError('City', 'state');
    }
  }

  @override
  City rebuild(void Function(CityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CityBuilder toBuilder() => new CityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is City &&
        id == other.id &&
        name == other.name &&
        zipCode == other.zipCode &&
        country == other.country &&
        countryCode == other.countryCode &&
        state == other.state;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), zipCode.hashCode),
                country.hashCode),
            countryCode.hashCode),
        state.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('City')
          ..add('id', id)
          ..add('name', name)
          ..add('zipCode', zipCode)
          ..add('country', country)
          ..add('countryCode', countryCode)
          ..add('state', state))
        .toString();
  }
}

class CityBuilder implements Builder<City, CityBuilder> {
  _$City _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _zipCode;
  String get zipCode => _$this._zipCode;
  set zipCode(String zipCode) => _$this._zipCode = zipCode;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _countryCode;
  String get countryCode => _$this._countryCode;
  set countryCode(String countryCode) => _$this._countryCode = countryCode;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  CityBuilder();

  CityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _zipCode = _$v.zipCode;
      _country = _$v.country;
      _countryCode = _$v.countryCode;
      _state = _$v.state;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(City other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$City;
  }

  @override
  void update(void Function(CityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$City build() {
    final _$result = _$v ??
        new _$City._(
            id: id,
            name: name,
            zipCode: zipCode,
            country: country,
            countryCode: countryCode,
            state: state);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
