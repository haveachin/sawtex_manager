import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/widgets/list_dismissible.dart';
import 'package:sawtex_manager/widgets/manager/edit_page.dart';

import 'bloc/bloc.dart';
import 'bloc/manager_model.dart';
import 'bloc/service.dart';

typedef IconButton BuildEditButton<T>(BuildContext context, T item);

class ManagerListPage<T extends ManagerModel> extends StatefulWidget {
  final ApiService<T> apiService;
  final Widget Function(BuildContext, T, Map<String, dynamic>) buildFrom;
  final ListTile Function(BuildContext, BuildEditButton<T>, T) buildListTile;

  ManagerListPage({
    Key key,
    @required this.apiService,
    @required this.buildFrom,
    @required this.buildListTile,
  }) : super(key: key);

  _ManagerListPageState createState() => _ManagerListPageState<T>();
}

class _ManagerListPageState<T extends ManagerModel>
    extends State<ManagerListPage<T>> {
  ManagerBloc<T> _bloc;
  List<T> _items = [];

  @override
  void initState() {
    super.initState();
    _bloc = ManagerBloc<T>(widget.apiService);
  }

  IconButton _buildEditButton(BuildContext context, T item) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () => Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (BuildContext context) => ManagerEditPage<T>(
                item: item,
                apiService: widget.apiService,
                buildFrom: widget.buildFrom,
              ),
            ),
          )
          .whenComplete(() => _bloc.dispatch(GetMany())),
    );
  }

  Widget _buildListView() {
    return RefreshIndicator(
      onRefresh: () async => _bloc.dispatch(GetMany()),
      child: ListView.separated(
        itemCount: _items.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) => ListDismissible(
          key: Key(_items[index]?.id),
          onDismissed: () {
            _bloc.dispatch(DeleteOne(_items[index].id));
            _items.removeAt(index);
          },
          child: widget.buildListTile(context, _buildEditButton, _items[index]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, ManagerState state) {
        if (state is InitialBasicState) {
          _bloc.dispatch(GetMany());
        } else if (state is LoadedMany) {
          _items = state.items.toList();
        }
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, ManagerState state) {
          if (state is LoadingMany) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return _buildListView();
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
