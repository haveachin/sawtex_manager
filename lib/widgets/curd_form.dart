import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';
import 'package:sawtex_manager/utils/toasts.dart';

class CurdForm<T extends CurdModel> extends StatefulWidget {
  final CurdBloc<T> bloc;
  final Widget Function() builder;
  final T initialValue;
  final void Function() onSave;

  CurdForm({
    Key key,
    this.bloc,
    @required this.builder,
    this.initialValue,
    this.onSave,
  }) : super(key: key);

  _CurdFormState createState() => _CurdFormState<T>();
}

class _CurdFormState<T extends CurdModel> extends State<CurdForm> {
  final _formBuilderKey = GlobalKey<FormBuilderState>();

  Widget _buildSubmitButton(BuildContext context) {
    final bloc = BlocProvider.of<CurdBloc<T>>(context);
    return RaisedButton(
      child: Text((widget?.initialValue == null) ? 'CREATE' : 'SAVE'),
      onPressed: () => _onSubmit(bloc),
    );
  }

  void _onSubmit(CurdBloc<T> bloc) {
    if (!_formBuilderKey.currentState.validate()) return;
    _formBuilderKey.currentState.save();
    if (widget.onSave != null) widget.onSave();

    final formData = _formBuilderKey.currentState.value;
    formData['id'] = widget?.initialValue?.id;

    if (widget?.initialValue == null)
      bloc.dispatch(AddOne<T>.fromMap(formData));
    else
      bloc.dispatch(UpdateOne<T>.fromMap(formData));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurdBloc<T>, CurdState>(
      bloc: widget.bloc,
      listener: (BuildContext context, CurdState state) {
        if (state is ActionFailed) showErrorToast(state.error.message);
      },
      child: BlocBuilder<CurdBloc<T>, CurdState>(
        bloc: widget.bloc,
        builder: (BuildContext context, CurdState state) {
          return Container(
            margin: EdgeInsets.only(top: 16.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                FormBuilder(
                  key: _formBuilderKey,
                  child: widget.builder(),
                ),
                SizedBox(height: 16.0),
                if (state is AddingOne || state is UpdatingOne)
                  Container(
                    alignment: Alignment.center,
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
