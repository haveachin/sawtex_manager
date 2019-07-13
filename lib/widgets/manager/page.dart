import 'package:flutter/material.dart';

import 'bloc/manager_model.dart';
import 'edit_page.dart';
import 'list_page.dart';

class ManagerPage<T extends ManagerModel> extends StatefulWidget {
  final String title;
  final ManagerEditPage<T> editPage;
  final ManagerListPage<T> listPage;

  ManagerPage({
    Key key,
    this.title,
    this.editPage,
    this.listPage,
  }) : super(key: key);

  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
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
            widget.editPage,
            widget.listPage,
          ],
        ),
      ),
    );
  }
}
