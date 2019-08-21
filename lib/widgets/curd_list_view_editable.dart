import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/curd_model.dart';

import 'list_tile_dismissible.dart';

class CurdListViewEditable<T extends CurdModel> extends StatelessWidget {
  final List<T> items;
  final Future Function(T) onEdit;
  final Icon tileIcon;
  final Widget Function(T) titelBuilder;
  final Widget Function(T) subtitleBuilder;

  const CurdListViewEditable({
    Key key,
    @required this.items,
    @required this.onEdit,
    @required this.tileIcon,
    @required this.titelBuilder,
    @required this.subtitleBuilder,
  }) : super(key: key);

  Widget _buildEditButton(BuildContext context, T item) {
    final bloc = BlocProvider.of<CurdBloc<T>>(context);
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () =>
          onEdit(item).whenComplete(() => bloc.dispatch(GetMany())),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CurdBloc<T>>(context);
    return RefreshIndicator(
      onRefresh: () async => bloc.dispatch(GetMany()),
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) => ListTileDismissible(
          key: Key(items[index]?.id),
          onDismissed: () {
            bloc.dispatch(DeleteOne(items[index].id));
            items.removeAt(index);
            bloc.dispatch(GetMany());
          },
          child: ListTile(
            leading: tileIcon,
            title: titelBuilder(items[index]),
            subtitle: subtitleBuilder(items[index]),
            trailing: _buildEditButton(context, items[index]),
          ),
        ),
      ),
    );
  }
}
