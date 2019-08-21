import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';
import 'package:sawtex_manager/models/serializers.dart';

import 'error_alert_box.dart';

class CurdForm<T extends CurdModel> extends StatefulWidget {
  final T initialValue;
  final Widget Function(Map<String, dynamic>) builder;
  final void Function(Map<String, dynamic>) onSave;

  CurdForm({
    Key key,
    this.initialValue,
    @required this.builder,
    this.onSave,
  }) : super(key: key);

  _CurdFormState createState() => _CurdFormState<T>();
}

class _CurdFormState<T extends CurdModel> extends State<CurdForm> {
  Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null)
      _formData = serializers.serializeWith(
          serializers.serializerForType(T), widget.initialValue);
  }

  Widget _buildSubmitButton(BuildContext context) {
    final CurdBloc<T> bloc = BlocProvider.of<CurdBloc<T>>(context);
    return RaisedButton(
      child: Text((widget?.initialValue == null) ? 'Add' : 'Save'),
      onPressed: () => _onSubmit(bloc),
    );
  }

  void _onSubmit(CurdBloc<T> bloc) {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    if (widget?.onSave != null) widget.onSave(_formData);

    print(_formData);

    if (widget?.initialValue == null) {
      bloc.dispatch(AddOne<T>.fromMap(_formData));
    } else {
      bloc.dispatch(UpdateOne<T>.fromMap(_formData));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurdBloc<T>, CurdState>(
      listener: (BuildContext context, CurdState state) {
        if (state is ActionFailed)
          showToastWidget(
            ErrorAlertBox(
              title: "Test", //"${state.error.status}: ${state.error.message}",
            ),
            duration: Duration(seconds: 5),
          );
      },
      child: BlocBuilder<CurdBloc<T>, CurdState>(
        builder: (BuildContext context, CurdState state) {
          return AnimatedContainer(
            duration: Duration(seconds: 1),
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Form(
                    key: _formKey,
                    child: widget.builder(_formData),
                  ),
                ),
                if (state is AddingOne || state is UpdatingOne)
                  Container(
                    padding: EdgeInsets.all(3.0),
                    child: CircularProgressIndicator(),
                  )
                else
                  _buildSubmitButton(context),
              ],
            ),
          );
        },
      ),
    );
  }
}
