import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class Translation {
  final BuildContext context;

  Translation._(this.context);

  factory Translation.of(BuildContext context) {
    return Translation._(context);
  }

  String get authTitle => FlutterI18n.translate(context, 'auth.title');
  String get authAuthenticating => FlutterI18n.translate(context, 'auth.authenticating');
  String get authTextFieldUsername => FlutterI18n.translate(context, 'auth.textField.username');
  String get authTextFieldPassword => FlutterI18n.translate(context, 'auth.textField.password');
  String get authCheckBoxRememberMe => FlutterI18n.translate(context, 'auth.checkBox.rememberMe');
  String get authButtonLogin => FlutterI18n.translate(context, 'auth.button.login');
  String get validatorUsernamePattern => FlutterI18n.translate(context, 'validator.username.pattern');
  String get validatorUsernameLenghtMin => FlutterI18n.translate(context, 'validator.username.lenght.min');
  String get validatorPasswordLenghtMin => FlutterI18n.translate(context, 'validator.password.lenght.min');
  String get validatorIP => FlutterI18n.translate(context, 'validator.ip');
  String get validatorPort => FlutterI18n.translate(context, 'validator.port');
  String get validatorEmail => FlutterI18n.translate(context, 'validator.email');
  String get validatorISOCode => FlutterI18n.translate(context, 'validator.isoCode');
}