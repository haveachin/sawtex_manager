import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/models/serializers.dart';

import 'bloc/bloc.dart';
import 'bloc/manager_model.dart';
import 'bloc/service.dart';

class ManagerEditPage<T extends ManagerModel> extends StatefulWidget {
  final T item;
  final ApiService apiService;
  final Widget Function(BuildContext, T, Map<String, dynamic>) buildFrom;

  ManagerEditPage({
    Key key,
    this.item,
    @required this.apiService,
    @required this.buildFrom,
  }) : super(key: key);

  _ManagerEditPageState<T> createState() => _ManagerEditPageState<T>();
}

class _ManagerEditPageState<T extends ManagerModel>
    extends State<ManagerEditPage<T>> {
  Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();
  ManagerBloc<T> _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ManagerBloc<T>(widget.apiService);

    if (widget?.item == null) return;

    _formData = serializers.serializeWith(
        serializers.serializerForType(T), widget.item);
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.buildFrom(context, widget.item, _formData),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return MaterialButton(
      child: Text((widget?.item == null) ? 'ADD' : 'SAVE'),
      onPressed: () {
        if (!_formKey.currentState.validate()) return;
        _formKey.currentState.save();

        print(_formData);

        if (widget?.item == null) {
          _bloc.dispatch(AddOne<T>.fromMap(_formData));
        } else {
          _bloc.dispatch(UpdateOne<T>.fromMap(_formData));
        }
      },
    );
  }

  GestureDetector _buildPageContent(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, ManagerState state) {
          return ListView(
            children: <Widget>[
              if (state is ActionFailed)
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "${state.error.status}: ${state.error.message}",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildForm(context),
              ),
              (state is AddingOne || state is UpdatingOne)
                  ? Padding(
                      padding: EdgeInsets.all(3.0),
                      child: CircularProgressIndicator(),
                    )
                  : _buildSubmitButton(context),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget?.item == null
        ? _buildPageContent(context)
        : Scaffold(
            appBar: AppBar(
              title: Text('Editing'),
            ),
            body: BlocListener(
              bloc: _bloc,
              listener: (BuildContext context, ManagerState state) {
                if (state is UpdatedOne) {
                  Navigator.pop(context);
                }
              },
              child: _buildPageContent(context),
            ));
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
