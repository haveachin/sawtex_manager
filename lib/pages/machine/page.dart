import 'package:flutter/material.dart';

import 'edit_page.dart';
import 'list_page.dart';

class MachinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machine Page'),
      ),
      body: MachineListPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => MachineEditPage(),
          ),
        ),
      ),
    );
  }
}
