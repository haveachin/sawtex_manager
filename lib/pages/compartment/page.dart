import 'package:flutter/material.dart';
import 'package:sawtex_manager/utils/translation.dart';

import 'edit_page.dart';
import 'list_page.dart';

class CompartmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translation.of(context).compartmentPageTitle),
      ),
      body: CompartmentListPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => CompartmentEditPage(),
          ),
        ),
      ),
    );
  }
}
