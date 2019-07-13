import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawtex_manager/models/token.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivityPageState();
  }
}

class _ActivityPageState extends State<ActivityPage> {
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
              leading: Icon(Icons.location_city),
              title: Text('City'),
              onTap: () async {
                Navigator.pushNamed(context, '/city');
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('City v2'),
              onTap: () async {
                Navigator.pushNamed(context, '/cityv2');
              },
            ),
            Flexible(
              child: Container(),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                await FlutterSecureStorage()
                    .delete(key: Token.secureStorageKey);
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Activities'),
      ),
      body: Center(
        child: Text('Welcome to the activity page'),
      ),
    );
  }
}
