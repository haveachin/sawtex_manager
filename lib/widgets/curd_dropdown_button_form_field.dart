import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';
import 'package:sawtex_manager/services/curd_service.dart';

import 'curd_dropdown_button.dart';

class CurdDropdownButtonFormField<T extends CurdModel>
    extends FormField<String> {
  CurdDropdownButtonFormField({
    Key key,
    String initialValue,
    CurdService<T> apiService,
    @required DropdownMenuItem<String> Function(T) itemBuilder,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    List<T> items,
    Widget hint,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: false,
          builder: (FormFieldState<String> state) => CurdDropdownButton<T>(
            apiService: apiService,
            onChanged: state.didChange,
            itemBuilder: itemBuilder,
            initialValue: initialValue,
            items: items,
            hint: hint,
          ),
        );
}
