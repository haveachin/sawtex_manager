import 'package:flutter/material.dart';

import 'barcode_field.dart';

class BarcodeFormField extends FormField<String> {
  BarcodeFormField({
    Key key,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    String initialValue,
    bool autovalidate = false,
    bool enabled = true,
    String hintText,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          enabled: enabled,
          builder: (FormFieldState<String> state) {
            return BarcodeField(
              initialValue: initialValue,
              onChanged: state.didChange,
              hintText: hintText,
            );
          },
        );
}
