import 'package:flutter/material.dart';

import 'edit_page.dart';
import 'list_page.dart';

class CityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('City'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Add city',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'All cities',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CityEditPage(),
            CityListPage(),
          ],
        ),
      ),
    );
  }
}
