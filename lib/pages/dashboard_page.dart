import 'package:flutter/material.dart';
import 'package:sawtex_manager/models/token.dart';
import 'package:sawtex_manager/utils/translation.dart';

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
              title: Text(Translation.of(context).choose),
            ),
            ListTile(
              leading: Icon(Icons.dns),
              title: Text(Translation.of(context).machine),
              onTap: () async => Navigator.pushNamed(context, '/machine'),
            ),
            ListTile(
              leading: Icon(Icons.crop_16_9),
              title: Text(Translation.of(context).compartment),
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
        title: Text(Translation.of(context).dashboardPageTitle),
      ),
      body: Center(
        child: Text(Translation.of(context).placeholder),
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
                  child: Text(Translation.of(context).logout),
                ),
                CircularProgressIndicator(),
              ],
            );
          }

          final token = snapshot.data;

          if (token == null || snapshot.error != null) {
            return Text(Translation.of(context).logout);
          }

          final expiresIn = token.expiresAt.difference(DateTime.now());
          final hoursLeft = expiresIn.inHours;
          String message = '$hoursLeft ${Translation.of(context).hoursLeft}';

          if (hoursLeft == 0) {
            final minutesLeft = expiresIn.inMinutes;
            message = '$minutesLeft ${Translation.of(context).minutesLeft}';
          }

          return Row(
            children: <Widget>[
              Expanded(
                child: Text(Translation.of(context).logout),
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
