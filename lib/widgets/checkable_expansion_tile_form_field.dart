import 'package:flutter/widgets.dart';

import 'checkable_expansion_tile.dart';

class CheckableExpansionTileFormField extends FormField<bool> {
  CheckableExpansionTileFormField({
    Widget title,
    @required List<Widget> children,
    FormFieldSetter<bool> onSaved,
    FormFieldValidator<bool> validator,
    void Function(bool) onChanged,
    bool initialValue = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: false,
          builder: (FormFieldState<bool> state) => CheckableExpansionTile(
            title: title,
            initialValue: initialValue,
            onChanged: (bool value) {
              if (onChanged != null) onChanged(value);
              state.didChange(value);
            },
            children: children,
          ),
        );
}
