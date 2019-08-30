import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class Translation {
  final BuildContext context;

  Translation._(this.context);

  factory Translation.of(BuildContext context) {
    return Translation._(context);
  }

  // Validator
  String get validatorUsernamePattern => FlutterI18n.translate(context, 'validator.username.pattern');
  String get validatorUsernameLenghtMin => FlutterI18n.translate(context, 'validator.username.lenght.min');
  String get validatorPasswordLenghtMin => FlutterI18n.translate(context, 'validator.password.lenght.min');
  String get validatorIP => FlutterI18n.translate(context, 'validator.ip');
  String get validatorPort => FlutterI18n.translate(context, 'validator.port');
  String get validatorEmail => FlutterI18n.translate(context, 'validator.email');
  String get validatorISOCode => FlutterI18n.translate(context, 'validator.isoCode');

  // AuthPage
  String get authPageTitle => FlutterI18n.translate(context, 'authPage.title');

  // DashboardPage
  String get dashboardPageTitle => FlutterI18n.translate(context, 'dashboardPage.title');

  // MachinePage
  String get machinePageTitle => FlutterI18n.translate(context, 'machinePage.title');
  String get machinePageTitleNew => FlutterI18n.translate(context, 'machinePage.titleNew');

  // CompartmentPage
  String get compartmentPageTitle => FlutterI18n.translate(context, 'compartmentPage.title');
  String get compartmentPageTitleNew => FlutterI18n.translate(context, 'compartmentPage.titleNew');

  // Words
  String get create => FlutterI18n.translate(context, 'words.create');
  String get save => FlutterI18n.translate(context, 'words.save');
  String get delete => FlutterI18n.translate(context, 'words.delete');
  String get machine => FlutterI18n.translate(context, 'words.machine');
  String get compartment => FlutterI18n.translate(context, 'words.compartment');
  String get choose => FlutterI18n.translate(context, 'words.choose');
  String get description => FlutterI18n.translate(context, 'words.description');
  String get noDescription => FlutterI18n.translate(context, 'words.noDescription');
  String get ipAddress => FlutterI18n.translate(context, 'words.ipAddress');
  String get port => FlutterI18n.translate(context, 'words.port');
  String get logout => FlutterI18n.translate(context, 'words.logout');
  String get login => FlutterI18n.translate(context, 'words.login');
  String get hoursLeft => FlutterI18n.translate(context, 'words.hoursLeft');
  String get minutesLeft => FlutterI18n.translate(context, 'words.minutesLeft');
  String get placeholder => FlutterI18n.translate(context, 'words.placeholder');
  String get username => FlutterI18n.translate(context, 'words.username');
  String get password => FlutterI18n.translate(context, 'words.password');
  String get rememberMe => FlutterI18n.translate(context, 'words.rememberMe');
  String get authenticating => FlutterI18n.translate(context, 'words.authenticating');
  String get code => FlutterI18n.translate(context, 'words.code');
}