import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawtex_manager/service/api_clients.dart';

import 'app_localizations.dart';
import 'models/token.dart';
import 'ui/activity/page.dart';
import 'ui/city/page.dart';
import 'ui/auth/page.dart';
import 'ui/user/page.dart';

void main() async {
  //debugPaintSizeEnabled = true;
  await ApiClients.init();
  runApp(MyApp());
  //ApiClients.dispose();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: _localeResolutionCallback,
      home: FutureBuilder(
        future: FlutterSecureStorage().read(key: Token.secureStorageKey),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || snapshot.error != null) {
            return AuthPage();
          }

          return ActivityPage();
        },
      ),
      routes: {
        '/auth': (BuildContext context) => AuthPage(),
        '/activity': (BuildContext context) => ActivityPage(),
        '/city': (BuildContext context) => CityPage(),
        '/cityv2': (BuildContext context) => UserPage(),
      },
    );
  }

  Locale _localeResolutionCallback(
    Locale locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale == null) return supportedLocales.first;

    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }

    return supportedLocales.first;
  }
}
