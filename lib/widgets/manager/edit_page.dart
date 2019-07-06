import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/bloc/basic/bloc.dart';

class ManagerEditPage<T> extends StatefulWidget {
  final T item;
  final BasicBloc<T> bloc;
  final Widget Function(BuildContext, T, Map<String, dynamic>) buildFrom;

  ManagerEditPage({
    Key key,
    this.item,
    @required this.bloc,
    @required this.buildFrom,
  }) : super(key: key);

  _ManagerEditPageState createState() => _ManagerEditPageState();
}

class _ManagerEditPageState extends State<ManagerEditPage> {
  final Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();

  Widget _buildCityForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.buildFrom(context, widget.item, _formData),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return MaterialButton(
      child: Text((widget?.item == null) ? 'ADD' : 'SAVE'),
      onPressed: () {
        if (!_formKey.currentState.validate()) return;
        _formKey.currentState.save();

        if (widget?.item == null) {
          widget.bloc.dispatch(AddOne.fromMap(_formData));
        } else {
          widget.bloc.dispatch(UpdateOne.fromMap(widget?.item?.id, _formData));
        }
      },
    );
  }

  GestureDetector _buildPageContent(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: BlocBuilder(
        bloc: widget.bloc,
        builder: (BuildContext context, BasicState state) {
          return ListView(
            children: <Widget>[
              if (state is ActionFailed)
                Text(
                  state.error.error,
                  style: TextStyle(color: Colors.red),
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildCityForm(context),
              ),
              (state is AddingOne || state is UpdatingOne)
                  ? Padding(
                      padding: EdgeInsets.all(3.0),
                      child: CircularProgressIndicator(),
                    )
                  : _buildAddButton(context),
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
              bloc: widget.bloc,
              listener: (BuildContext context, BasicState state) {
                if (state is UpdatedOne) {
                  Navigator.pop(context);
                }
              },
              child: _buildPageContent(context),
            ));
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
