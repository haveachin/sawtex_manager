library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

import 'address.dart';
import 'admin.dart';
import 'api_error.dart';
import 'city.dart';
import 'credentials.dart';
import 'creditor.dart';
import 'debtor.dart';
import 'employee.dart';
import 'role.dart';
import 'size_choice.dart';
import 'token.dart';
import 'user.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Address,
  Admin,
  ApiError,
  City,
  Credentials,
  Creditor,
  Debtor,
  Employee,
  Role,
  SizeChoice,
  Token,
  User,
])

final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();