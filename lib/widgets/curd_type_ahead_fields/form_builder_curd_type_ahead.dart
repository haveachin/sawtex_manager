import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';

import 'curd_type_ahead_form_field.dart';

class FormBuilderCurdTypeAhead<T extends CurdModel> extends StatelessWidget {
  final String attribute;
  final T initialValue;
  final String initialId;
  final String hintText;
  final Icon icon;
  final Map<String, dynamic> Function(String) patternFilter;
  final List<FormFieldValidator> validators;
  final ValueTransformer valueTransformer;

  FormBuilderCurdTypeAhead({
    Key key,
    this.attribute,
    this.initialValue,
    this.initialId,
    this.hintText = "",
    this.icon,
    @required this.patternFilter,
    this.validators = const [],
    this.valueTransformer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderCustomField(
      attribute: attribute,
      initialValue: initialValue,
      validators: validators,
      valueTransformer: valueTransformer,
      formField: CurdTypeAheadFormField<T>(
        patternFilter: patternFilter,
        hintText: hintText,
        icon: icon,
        initialId: initialId,
        initialValue: initialValue,
      ),
    );
  }
}
