import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oktoast/oktoast.dart';

import 'app_localizations.dart';
import 'models/token.dart';
import 'pages/machine/page.dart';
import 'services/api_clients.dart';
import 'pages/auth/page.dart';
import 'pages/dashboard_page.dart';

void main() async {
  //debugPaintSizeEnabled = true;
  await ApiClients.init();
  runApp(MyApp());
  //ApiClients.dispose();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          buttonColor: Colors.blue,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
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

            return DashboardPage();
          },
        ),
        routes: {
          '/auth': (BuildContext context) => AuthPage(),
          '/dashboard': (BuildContext context) => DashboardPage(),
          '/machine': (BuildContext context) => MachinePage(),
          //'/city': (BuildContext context) => CityPage(),
          //'/user': (BuildContext context) => UserPage(),
          //'/roles': (BuildContext context) => RoleManagerPage(),
          //'/size-choices': (BuildContext context) => SizeChoiceManagerPage(),
        },
      ),
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
