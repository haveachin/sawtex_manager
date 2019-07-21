import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/widgets/manager/bloc/service.dart';

import 'manager/bloc/bloc.dart';
import 'manager/bloc/manager_model.dart';

class ManagerDropdownButton<T extends ManagerModel> extends StatefulWidget {
  final String initialId;
  final Iterable<T> items;
  final ApiService<T> apiService;
  final void Function(String) onChanged;
  final DropdownMenuItem<String> Function(T) itemBuilder;

  const ManagerDropdownButton({
    Key key,
    this.initialId,
    this.items,
    @required this.apiService,
    @required this.onChanged,
    @required this.itemBuilder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ManagerDropdownButtonState<T>();
}

class _ManagerDropdownButtonState<T extends ManagerModel>
    extends State<ManagerDropdownButton<T>> {
  ManagerBloc<T> _bloc;
  String _currentId;
  Iterable<T> _items;

  @override
  void initState() {
    super.initState();
    _currentId = widget.initialId;
    _bloc = ManagerBloc<T>(widget.apiService);
    _items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, ManagerState state) {
        if (state is InitialState && _items == null) {
          _bloc.dispatch(GetMany());
        } else if (state is LoadedMany<T>) {
          _items = state.items;
        }
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, ManagerState state) {
          if (state is LoadedMany || _items != null) {
            return DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select'),
              value: _currentId,
              onChanged: (String newValue) => setState(
                () {
                  _currentId = newValue;
                  widget.onChanged(_currentId);
                },
              ),
              items: _items
                  .map<DropdownMenuItem<String>>(widget.itemBuilder)
                  .toList(),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
