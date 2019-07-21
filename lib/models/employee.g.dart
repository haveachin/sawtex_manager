// GENERATED CODE - DO NOT MODIFY BY HAND

part of employee;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Employee> _$employeeSerializer = new _$EmployeeSerializer();

class _$EmployeeSerializer implements StructuredSerializer<Employee> {
  @override
  final Iterable<Type> types = const [Employee, _$Employee];
  @override
  final String wireName = 'Employee';

  @override
  Iterable serialize(Serializers serializers, Employee object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'supervisorId',
      serializers.serialize(object.supervisorId,
          specifiedType: const FullType(String)),
      'roleIds',
      serializers.serialize(object.roleIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'sizeChoiceId',
      serializers.serialize(object.sizeChoiceId,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'canFill',
      serializers.serialize(object.canFill,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Employee deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmployeeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'supervisorId':
          result.supervisorId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'roleIds':
          result.roleIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'sizeChoiceId':
          result.sizeChoiceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'canFill':
          result.canFill = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Employee extends Employee {
  @override
  final String supervisorId;
  @override
  final BuiltList<String> roleIds;
  @override
  final String sizeChoiceId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final bool canFill;

  factory _$Employee([void Function(EmployeeBuilder) updates]) =>
      (new EmployeeBuilder()..update(updates)).build();

  _$Employee._(
      {this.supervisorId,
      this.roleIds,
      this.sizeChoiceId,
      this.firstName,
      this.lastName,
      this.canFill})
      : super._() {
    if (supervisorId == null) {
      throw new BuiltValueNullFieldError('Employee', 'supervisorId');
    }
    if (roleIds == null) {
      throw new BuiltValueNullFieldError('Employee', 'roleIds');
    }
    if (sizeChoiceId == null) {
      throw new BuiltValueNullFieldError('Employee', 'sizeChoiceId');
    }
    if (firstName == null) {
      throw new BuiltValueNullFieldError('Employee', 'firstName');
    }
    if (lastName == null) {
      throw new BuiltValueNullFieldError('Employee', 'lastName');
    }
    if (canFill == null) {
      throw new BuiltValueNullFieldError('Employee', 'canFill');
    }
  }

  @override
  Employee rebuild(void Function(EmployeeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeBuilder toBuilder() => new EmployeeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Employee &&
        supervisorId == other.supervisorId &&
        roleIds == other.roleIds &&
        sizeChoiceId == other.sizeChoiceId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        canFill == other.canFill;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, supervisorId.hashCode), roleIds.hashCode),
                    sizeChoiceId.hashCode),
                firstName.hashCode),
            lastName.hashCode),
        canFill.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Employee')
          ..add('supervisorId', supervisorId)
          ..add('roleIds', roleIds)
          ..add('sizeChoiceId', sizeChoiceId)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('canFill', canFill))
        .toString();
  }
}

class EmployeeBuilder implements Builder<Employee, EmployeeBuilder> {
  _$Employee _$v;

  String _supervisorId;
  String get supervisorId => _$this._supervisorId;
  set supervisorId(String supervisorId) => _$this._supervisorId = supervisorId;

  ListBuilder<String> _roleIds;
  ListBuilder<String> get roleIds =>
      _$this._roleIds ??= new ListBuilder<String>();
  set roleIds(ListBuilder<String> roleIds) => _$this._roleIds = roleIds;

  String _sizeChoiceId;
  String get sizeChoiceId => _$this._sizeChoiceId;
  set sizeChoiceId(String sizeChoiceId) => _$this._sizeChoiceId = sizeChoiceId;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  bool _canFill;
  bool get canFill => _$this._canFill;
  set canFill(bool canFill) => _$this._canFill = canFill;

  EmployeeBuilder();

  EmployeeBuilder get _$this {
    if (_$v != null) {
      _supervisorId = _$v.supervisorId;
      _roleIds = _$v.roleIds?.toBuilder();
      _sizeChoiceId = _$v.sizeChoiceId;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _canFill = _$v.canFill;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Employee other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Employee;
  }

  @override
  void update(void Function(EmployeeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Employee build() {
    _$Employee _$result;
    try {
      _$result = _$v ??
          new _$Employee._(
              supervisorId: supervisorId,
              roleIds: roleIds.build(),
              sizeChoiceId: sizeChoiceId,
              firstName: firstName,
              lastName: lastName,
              canFill: canFill);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'roleIds';
        roleIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Employee', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
