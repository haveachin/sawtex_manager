library token;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'serializers.dart';

part 'token.g.dart';

abstract class Token implements Built<Token, TokenBuilder> {
  String get token;
  DateTime get expiresAt;

  static const String tokenSecureStorageKey = 'sawtexApiToken';
  static const String expiresAtSecureStorageKey = 'sawtexApiExpiresAt';

  Token._();

  factory Token([updates(TokenBuilder b)]) = _$Token;

  static Future<Token> formSecureStorage() async {
    final storage = FlutterSecureStorage();
    final tokenString = await storage.read(key: Token.tokenSecureStorageKey);
    if (tokenString == null) return null;
    final expiresAtString =
        await storage.read(key: Token.expiresAtSecureStorageKey);
    if (expiresAtString == null) return null;

    DateTime expiresAt;
    try {
      expiresAt = DateTime.parse(expiresAtString ?? "");
    } on Exception catch (_) {
      return null;
    }

    return Token((b) => b
      ..token = tokenString
      ..expiresAt = expiresAt);
  }

  Future<void> saveToSecureStorage() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: Token.tokenSecureStorageKey, value: token);
    await storage.write(
        key: Token.expiresAtSecureStorageKey, value: expiresAt.toString());
  }

  static Future<void> deleteFromSecureStorage() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: Token.tokenSecureStorageKey);
    await storage.delete(key: Token.expiresAtSecureStorageKey);
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Token.serializer, this));
  }

  static Token fromJson(String jsonString) {
    return serializers.deserializeWith(
        Token.serializer, json.decode(jsonString));
  }

  static Serializer<Token> get serializer => _$tokenSerializer;

  @override
  String toString() {
    return 'Bearer $token';
  }
}
