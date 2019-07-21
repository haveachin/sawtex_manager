import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_localizations.dart';
import 'bloc/bloc.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _FormData {
  String username, password;
}

class _AuthPageState extends State<AuthPage> {
  final _formData = _FormData();
  final _formKey = GlobalKey<FormState>();
  final _authBloc = AuthBloc();

  Widget _buildUsernameTextField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).translate('username'),
      ),
      validator: (String value) {
        if (value.isEmpty || value.length < 4) {
          return 'Username is required';
        }
        return null;
      },
      onSaved: (String value) {
        _formData.username = value;
      },
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).translate('password'),
      ),
      validator: (String value) {
        if (value.isEmpty || value.length < 0) {
          return 'Password is required';
        }
        return null;
      },
      onSaved: (String value) {
        _formData.password = value;
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return RaisedButton(
      child: Text(
        AppLocalizations.of(context).translate('login'),
      ),
      onPressed: () => _submitForm(context),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: BlocBuilder(
          bloc: _authBloc,
          builder: (BuildContext context, AuthState state) {
            if (state is LoggingIn) {
              return Padding(
                padding: EdgeInsets.all(3.0),
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: <Widget>[
                if (state is LoginFailed)
                  Text(
                    state.error.message,
                    style: TextStyle(color: Colors.red),
                  ),
                _buildUsernameTextField(context),
                SizedBox(height: 16.0),
                _buildPasswordTextField(context),
                SizedBox(height: 32.0),
                _buildLoginButton(context)
              ],
            );
          },
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    _authBloc.dispatch(Login(_formData.username, _formData.password));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Admin Login',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: BlocListener(
                bloc: _authBloc,
                listener: (BuildContext context, AuthState state) {
                  if (state is LoggedIn) {
                    Navigator.pushReplacementNamed(context, '/activity');
                  }
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 48.0),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildLoginForm(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
