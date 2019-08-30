import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'barcode_form_field.dart';

class FormBuilderBarcodeField extends StatelessWidget {
  final String attribute;
  final String initialValue;
  final List<FormFieldValidator> validators;
  final ValueTransformer valueTransformer;
  final String hintText;

  const FormBuilderBarcodeField({
    Key key,
    this.attribute,
    this.initialValue,
    this.validators = const [],
    this.valueTransformer,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderCustomField(
      attribute: attribute,
      initialValue: initialValue,
      validators: validators,
      valueTransformer: valueTransformer,
      formField: BarcodeFormField(
        initialValue: initialValue,
        hintText: hintText,
      ),
    );
  }
}
