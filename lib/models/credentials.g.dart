// GENERATED CODE - DO NOT MODIFY BY HAND

part of credentials;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Credentials> _$credentialsSerializer = new _$CredentialsSerializer();

class _$CredentialsSerializer implements StructuredSerializer<Credentials> {
  @override
  final Iterable<Type> types = const [Credentials, _$Credentials];
  @override
  final String wireName = 'Credentials';

  @override
  Iterable serialize(Serializers serializers, Credentials object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Credentials deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CredentialsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Credentials extends Credentials {
  @override
  final String username;
  @override
  final String password;

  factory _$Credentials([void Function(CredentialsBuilder) updates]) =>
      (new CredentialsBuilder()..update(updates)).build();

  _$Credentials._({this.username, this.password}) : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('Credentials', 'username');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('Credentials', 'password');
    }
  }

  @override
  Credentials rebuild(void Function(CredentialsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CredentialsBuilder toBuilder() => new CredentialsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Credentials &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Credentials')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class CredentialsBuilder implements Builder<Credentials, CredentialsBuilder> {
  _$Credentials _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  CredentialsBuilder();

  CredentialsBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Credentials other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Credentials;
  }

  @override
  void update(void Function(CredentialsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Credentials build() {
    final _$result =
        _$v ?? new _$Credentials._(username: username, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
