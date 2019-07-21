library employee;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'employee.g.dart';

abstract class Employee implements Built<Employee, EmployeeBuilder> {
  String get supervisorId;
  BuiltList<String> get roleIds;
  String get sizeChoiceId;
  String get firstName;
  String get lastName;
  bool get canFill;

  Employee._();

  factory Employee([updates(EmployeeBuilder b)]) = _$Employee;

  String toJson() {
    return json.encode(serializers.serializeWith(Employee.serializer, this));
  }

  static Employee fromJson(String jsonString) {
    return serializers.deserializeWith(Employee.serializer, json.decode(jsonString));
  }

  static Serializer<Employee> get serializer => _$employeeSerializer;
}