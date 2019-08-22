import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawtex_manager/models/token.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              leading: Icon(Icons.dns),
              title: Text('Machine'),
              onTap: () async => Navigator.pushNamed(context, '/machine'),
            ),
            ListTile(
              leading: Icon(Icons.crop_16_9),
              title: Text('Compartment'),
              onTap: () async => Navigator.pushNamed(context, '/compartment'),
            ),/* 
            ListTile(
              leading: Icon(Icons.people),
              title: Text('User'),
              onTap: () async => Navigator.pushNamed(context, '/user'),
            ),
            ListTile(
              leading: Icon(Icons.content_paste),
              title: Text('Role'),
              onTap: () async => Navigator.pushNamed(context, '/roles'),
            ),
            ListTile(
              leading: Icon(Icons.filter_none),
              title: Text('Size Choice'),
              onTap: () async => Navigator.pushNamed(context, '/size-choices'),
            ), */
            Flexible(
              child: Container(),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                await Token.deleteFromSecureStorage();
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Activities'),
      ),
      body: Container(),
    );
  }
}
