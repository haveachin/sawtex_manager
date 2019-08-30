import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';

class CurdTypeAheadField<T extends CurdModel> extends StatefulWidget {
  final T initialValue;
  final String initialId;
  final String hintText;
  final Icon icon;
  final Map<String, dynamic> Function(String) patternFilter;
  final void Function(String) onChanged;

  CurdTypeAheadField({
    Key key,
    this.initialValue,
    this.initialId,
    this.hintText = "",
    this.icon,
    @required this.patternFilter,
    this.onChanged,
  }) : super(key: key);

  _CurdTypeAheadFieldState createState() => _CurdTypeAheadFieldState<T>();
}

class _CurdTypeAheadFieldState<T extends CurdModel>
    extends State<CurdTypeAheadField> {
  T _item;
  TextEditingController _controller;
  FocusNode _focusNode;
  bool _editing;
  CurdBloc<T> _bloc;

  @override
  void initState() {
    super.initState();
    _item = widget.initialValue;
    _bloc = CurdBloc<T>();
    final itemId = widget.initialId;
    if (itemId != null) _bloc.dispatch(GetOne(itemId));
    _editing = (_item == null && itemId == null);
    _focusNode = FocusNode();
    _controller = TextEditingController(text: _item?.toString() ?? "");
  }

  FutureOr<List<T>> _getMachines(String pattern) async {
    final bloc = CurdBloc<T>();
    final state = await bloc.getMany(widget.patternFilter(pattern));

    if (state is LoadedMany<T>) {
      return state.items.toList();
    }

    return [];
  }

  void _selectItem(T item) {
    widget?.onChanged(item.id);
    _item = item;
    _controller.text = _item.toString();
    setState(() => _editing = false);
  }

  void _deselectItem() {
    widget?.onChanged(null);
    _item = null;
    setState(() => _editing = true);
    FocusScope.of(context).requestFocus(_focusNode);
  }

  Widget _buildTypeAhead() {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        focusNode: _focusNode,
        controller: _controller,
        decoration: InputDecoration(
          labelText: widget.hintText,
          border: OutlineInputBorder(),
        ),
      ),
      getImmediateSuggestions: true,
      itemBuilder: (BuildContext context, dynamic item) => ListTile(
        leading: widget.icon,
        title: Text(item.toString()),
      ),
      suggestionsCallback: _getMachines,
      onSuggestionSelected: _selectItem,
    );
  }

  Widget _buildSavedTile(BuildContext context) {
    return ListTile(
      title: Text(_item.toString()),
      subtitle: Text(widget.hintText),
      leading: widget.icon,
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: _deselectItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, CurdState state) {
        if (state is LoadedOne) _item = state.item;
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, CurdState state) {
          return (_editing) ? _buildTypeAhead() : _buildSavedTile(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _bloc.dispose();
    super.dispose();
  }
}
