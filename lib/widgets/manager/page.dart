import 'package:flutter/material.dart';
import 'package:sawtex_manager/bloc/basic/basic_bloc.dart';
import 'package:sawtex_manager/bloc/basic/service.dart';
import 'package:sawtex_manager/service/api_clients.dart';

import '../list_dismissible.dart';
import 'edit_page.dart';
import 'list_page.dart';

class ManagerPage<T> extends StatefulWidget {
  final String title;
  final ApiService<T> apiService;
  final Widget Function(BuildContext, T, Map<String, dynamic>) buildFrom;
  final ListDismissible Function(BuildContext, int) buildListDismissible;

  ManagerPage({
    Key key,
    this.title,
    this.apiService,
    this.buildFrom,
    this.buildListDismissible,
  }) : super(key: key);

  _ManagerPageState createState() => _ManagerPageState<T>();
}

class _ManagerPageState<T> extends State<ManagerPage<T>> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Add one',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'Manage',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ManagerEditPage<T>(
              bloc: BasicBloc<T>(widget.apiService),
              buildFrom: widget.buildFrom,
            ),
            ManagerListPage<T>(
              bloc: BasicBloc<T>(widget.apiService),
              buildListDismissible: widget.buildListDismissible,
            ),
          ],
        ),
      ),
    );
  }
}
