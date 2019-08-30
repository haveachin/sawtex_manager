import 'package:flutter/material.dart';
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
            ),
            Flexible(
              child: Container(),
            ),
            _buildLogoutTile(context),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text(
          'Nothing here yet',
        ),
      ),
    );
  }

  ListTile _buildLogoutTile(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: FutureBuilder(
        future: Token.formSecureStorage(),
        builder: (BuildContext context, AsyncSnapshot<Token> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Text('Logout'),
                ),
                CircularProgressIndicator(),
              ],
            );
          }

          final token = snapshot.data;

          if (token == null || snapshot.error != null) {
            return Text('Logout');
          }

          final expiresIn = token.expiresAt.difference(DateTime.now());
          final hoursLeft = expiresIn.inHours;
          String message = '$hoursLeft hours left';

          if (hoursLeft == 0) {
            final minutesLeft = expiresIn.inMinutes;
            message = '$minutesLeft minutes left';
          }

          return Row(
            children: <Widget>[
              Expanded(
                child: Text('Logout'),
              ),
              Text(
                message,
                style: Theme.of(context).textTheme.body1,
              ),
            ],
          );
        },
      ),
      onTap: () async {
        await Token.deleteFromSecureStorage();
        Navigator.pushReplacementNamed(context, '/auth');
      },
    );
  }
}
