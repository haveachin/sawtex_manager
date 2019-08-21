import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';
import 'package:sawtex_manager/services/curd_service.dart';

class CurdDropdownButton<T extends CurdModel> extends StatefulWidget {
  final CurdService<T> apiService;
  final void Function(String) onChanged;
  final DropdownMenuItem<String> Function(T) itemBuilder;
  final String initialValue;
  final List<T> items;
  final Widget hint;

  const CurdDropdownButton({
    Key key,
    @required this.apiService,
    @required this.onChanged,
    @required this.itemBuilder,
    this.initialValue,
    this.items,
    this.hint,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CurdDropdownButtonState<T>();
}

class _CurdDropdownButtonState<T extends CurdModel>
    extends State<CurdDropdownButton<T>> {
  CurdBloc<T> _bloc;
  String _currentId;
  List<T> _items;

  @override
  void initState() {
    super.initState();
    _currentId = widget?.initialValue;
    _items = widget.items;
    _bloc = CurdBloc<T>();
    if (_items == null) _bloc.dispatch(GetMany());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, CurdState state) {
        if (state is LoadedMany<T>) _items = state.items.toList();
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, CurdState state) {
          if (state is LoadedMany<T> || _items != null) {
            return DropdownButton<String>(
              isExpanded: true,
              hint: widget.hint ?? Text('Select'),
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
