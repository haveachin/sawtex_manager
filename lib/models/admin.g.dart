// GENERATED CODE - DO NOT MODIFY BY HAND

part of admin;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Admin> _$adminSerializer = new _$AdminSerializer();

class _$AdminSerializer implements StructuredSerializer<Admin> {
  @override
  final Iterable<Type> types = const [Admin, _$Admin];
  @override
  final String wireName = 'Admin';

  @override
  Iterable serialize(Serializers serializers, Admin object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(Address)));
    }
    return result;
  }

  @override
  Admin deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdminBuilder();

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
      }
    }

    return result.build();
  }
}

class _$Admin extends Admin {
  @override
  final Address address;

  factory _$Admin([void Function(AdminBuilder) updates]) =>
      (new AdminBuilder()..update(updates)).build();

  _$Admin._({this.address}) : super._();

  @override
  Admin rebuild(void Function(AdminBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminBuilder toBuilder() => new AdminBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Admin && address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc(0, address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Admin')..add('address', address))
        .toString();
  }
}

class AdminBuilder implements Builder<Admin, AdminBuilder> {
  _$Admin _$v;

  AddressBuilder _address;
  AddressBuilder get address => _$this._address ??= new AddressBuilder();
  set address(AddressBuilder address) => _$this._address = address;

  AdminBuilder();

  AdminBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Admin other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Admin;
  }

  @override
  void update(void Function(AdminBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Admin build() {
    _$Admin _$result;
    try {
      _$result = _$v ?? new _$Admin._(address: _address?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Admin', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
