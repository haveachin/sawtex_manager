import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawtex_manager/models/token.dart';
import 'package:sawtex_manager/widgets/form_fields/city_form_field.dart';

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
              onTap: () async => Navigator.pushNamed(context, '/city'),
            ),
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
        child: CityFormField(),
      ),
    );
  }
}
