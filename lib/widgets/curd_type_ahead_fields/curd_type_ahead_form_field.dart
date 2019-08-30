import 'package:flutter/material.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';

import 'curd_type_ahead_field.dart';

class CurdTypeAheadFormField<T extends CurdModel> extends FormField<String> {
  CurdTypeAheadFormField({
    Key key,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    T initialValue,
    String initialId,
    String hintText = "",
    Icon icon,
    bool autovalidate = false,
    bool enabled = true,
    @required Map<String, dynamic> Function(String) patternFilter,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialId,
          autovalidate: autovalidate,
          enabled: enabled,
          builder: (FormFieldState state) {
            return CurdTypeAheadField<T>(
              onChanged: state.didChange,
              patternFilter: patternFilter,
              hintText: hintText,
              icon: icon,
              initialId: initialId,
              initialValue: initialValue,
            );
          },
        );
}
