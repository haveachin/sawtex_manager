// GENERATED CODE - DO NOT MODIFY BY HAND

part of token;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Token> _$tokenSerializer = new _$TokenSerializer();

class _$TokenSerializer implements StructuredSerializer<Token> {
  @override
  final Iterable<Type> types = const [Token, _$Token];
  @override
  final String wireName = 'Token';

  @override
  Iterable serialize(Serializers serializers, Token object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'expiresAt',
      serializers.serialize(object.expiresAt,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Token deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expiresAt':
          result.expiresAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$Token extends Token {
  @override
  final String token;
  @override
  final DateTime expiresAt;

  factory _$Token([void Function(TokenBuilder) updates]) =>
      (new TokenBuilder()..update(updates)).build();

  _$Token._({this.token, this.expiresAt}) : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('Token', 'token');
    }
    if (expiresAt == null) {
      throw new BuiltValueNullFieldError('Token', 'expiresAt');
    }
  }

  @override
  Token rebuild(void Function(TokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenBuilder toBuilder() => new TokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Token &&
        token == other.token &&
        expiresAt == other.expiresAt;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, token.hashCode), expiresAt.hashCode));
  }
}

class TokenBuilder implements Builder<Token, TokenBuilder> {
  _$Token _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  DateTime _expiresAt;
  DateTime get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime expiresAt) => _$this._expiresAt = expiresAt;

  TokenBuilder();

  TokenBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _expiresAt = _$v.expiresAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Token other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Token;
  }

  @override
  void update(void Function(TokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Token build() {
    final _$result = _$v ?? new _$Token._(token: token, expiresAt: expiresAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
