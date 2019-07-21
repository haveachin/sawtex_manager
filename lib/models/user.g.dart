// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
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
    if (object.admin != null) {
      result
        ..add('admin')
        ..add(serializers.serialize(object.admin,
            specifiedType: const FullType(Admin)));
    }
    if (object.creditor != null) {
      result
        ..add('creditor')
        ..add(serializers.serialize(object.creditor,
            specifiedType: const FullType(Creditor)));
    }
    if (object.debtor != null) {
      result
        ..add('debtor')
        ..add(serializers.serialize(object.debtor,
            specifiedType: const FullType(Debtor)));
    }
    if (object.employee != null) {
      result
        ..add('employee')
        ..add(serializers.serialize(object.employee,
            specifiedType: const FullType(Employee)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

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
        case 'admin':
          result.admin.replace(serializers.deserialize(value,
              specifiedType: const FullType(Admin)) as Admin);
          break;
        case 'creditor':
          result.creditor.replace(serializers.deserialize(value,
              specifiedType: const FullType(Creditor)) as Creditor);
          break;
        case 'debtor':
          result.debtor.replace(serializers.deserialize(value,
              specifiedType: const FullType(Debtor)) as Debtor);
          break;
        case 'employee':
          result.employee.replace(serializers.deserialize(value,
              specifiedType: const FullType(Employee)) as Employee);
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String id;
  @override
  final DateTime updatedAt;
  @override
  final DateTime deletedAt;
  @override
  final Admin admin;
  @override
  final Creditor creditor;
  @override
  final Debtor debtor;
  @override
  final Employee employee;
  @override
  final String username;
  @override
  final String password;
  @override
  final String email;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.id,
      this.updatedAt,
      this.deletedAt,
      this.admin,
      this.creditor,
      this.debtor,
      this.employee,
      this.username,
      this.password,
      this.email})
      : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('User', 'username');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('User', 'email');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        updatedAt == other.updatedAt &&
        deletedAt == other.deletedAt &&
        admin == other.admin &&
        creditor == other.creditor &&
        debtor == other.debtor &&
        employee == other.employee &&
        username == other.username &&
        password == other.password &&
        email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, id.hashCode),
                                        updatedAt.hashCode),
                                    deletedAt.hashCode),
                                admin.hashCode),
                            creditor.hashCode),
                        debtor.hashCode),
                    employee.hashCode),
                username.hashCode),
            password.hashCode),
        email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('updatedAt', updatedAt)
          ..add('deletedAt', deletedAt)
          ..add('admin', admin)
          ..add('creditor', creditor)
          ..add('debtor', debtor)
          ..add('employee', employee)
          ..add('username', username)
          ..add('password', password)
          ..add('email', email))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DateTime _updatedAt;
  DateTime get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime updatedAt) => _$this._updatedAt = updatedAt;

  DateTime _deletedAt;
  DateTime get deletedAt => _$this._deletedAt;
  set deletedAt(DateTime deletedAt) => _$this._deletedAt = deletedAt;

  AdminBuilder _admin;
  AdminBuilder get admin => _$this._admin ??= new AdminBuilder();
  set admin(AdminBuilder admin) => _$this._admin = admin;

  CreditorBuilder _creditor;
  CreditorBuilder get creditor => _$this._creditor ??= new CreditorBuilder();
  set creditor(CreditorBuilder creditor) => _$this._creditor = creditor;

  DebtorBuilder _debtor;
  DebtorBuilder get debtor => _$this._debtor ??= new DebtorBuilder();
  set debtor(DebtorBuilder debtor) => _$this._debtor = debtor;

  EmployeeBuilder _employee;
  EmployeeBuilder get employee => _$this._employee ??= new EmployeeBuilder();
  set employee(EmployeeBuilder employee) => _$this._employee = employee;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _updatedAt = _$v.updatedAt;
      _deletedAt = _$v.deletedAt;
      _admin = _$v.admin?.toBuilder();
      _creditor = _$v.creditor?.toBuilder();
      _debtor = _$v.debtor?.toBuilder();
      _employee = _$v.employee?.toBuilder();
      _username = _$v.username;
      _password = _$v.password;
      _email = _$v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: id,
              updatedAt: updatedAt,
              deletedAt: deletedAt,
              admin: _admin?.build(),
              creditor: _creditor?.build(),
              debtor: _debtor?.build(),
              employee: _employee?.build(),
              username: username,
              password: password,
              email: email);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'admin';
        _admin?.build();
        _$failedField = 'creditor';
        _creditor?.build();
        _$failedField = 'debtor';
        _debtor?.build();
        _$failedField = 'employee';
        _employee?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
