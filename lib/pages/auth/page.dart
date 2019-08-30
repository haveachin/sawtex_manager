import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sawtex_manager/blocs/auth_bloc/bloc.dart';
import 'package:sawtex_manager/models/token.dart';
import 'package:sawtex_manager/utils/toasts.dart';
import 'package:sawtex_manager/utils/translation.dart';

class AuthPage extends StatefulWidget {
  final Token token;

  const AuthPage({Key key, this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final _formBuilderKey = GlobalKey<FormBuilderState>();
  final _authBloc = AuthBloc();
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    if (widget.token != null) {
      _authBloc.dispatch(ValidateToken(widget.token));
    }
  }

  Widget _buildLogo(BuildContext context) {
    return Icon(
      Icons.person_pin,
      size: 120.0,
      color: Theme.of(context).accentColor,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      Translation.of(context).authPageTitle,
      style: Theme.of(context).textTheme.title,
    );
  }

  Widget _buildUsernameTextField(BuildContext context) {
    return FormBuilderTextField(
      attribute: 'username',
      decoration: InputDecoration(
        labelText: Translation.of(context).username,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
      validators: [
        FormBuilderValidators.pattern(
          r'^[a-zA-Z0-9]{0,}$',
          errorText: Translation.of(context).validatorUsernamePattern,
        ),
        FormBuilderValidators.minLength(
          5,
          errorText: Translation.of(context).validatorUsernameLenghtMin,
        ),
      ],
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return FormBuilderTextField(
      attribute: 'password',
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: Translation.of(context).password,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () => setState(() => obscurePassword = !obscurePassword),
          icon:
              Icon((obscurePassword) ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      validators: [
        FormBuilderValidators.minLength(
          5,
          errorText: Translation.of(context).validatorPasswordLenghtMin,
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckBox(BuildContext context) {
    return FormBuilderCheckbox(
      attribute: 'rememberMe',
      label: Text(
        Translation.of(context).rememberMe,
      ),
      leadingInput: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        hoverColor: Colors.red,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return RaisedButton(
      child: Text(
        Translation.of(context).login.toUpperCase(),
      ),
      onPressed: () => _submitForm(context),
    );
  }

  void _submitForm(BuildContext context) async {
    if (!_formBuilderKey.currentState.validate()) return;
    _formBuilderKey.currentState.save();

    final formData = _formBuilderKey.currentState.value;

    _authBloc.dispatch(Login.fromMap(formData));
  }

  Widget _buildLoginForm(BuildContext context) {
    return FormBuilder(
      key: _formBuilderKey,
      child: Column(
        children: <Widget>[
          _buildUsernameTextField(context),
          SizedBox(height: 16.0),
          _buildPasswordTextField(context),
          _buildRememberMeCheckBox(context),
          SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: _buildLoginButton(context),
          )
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 16.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Translation.of(context).authenticating,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              height: height * 0.3,
              child: _buildLogo(context),
            ),
            BlocListener(
              bloc: _authBloc,
              listener: (BuildContext context, AuthState state) {
                if (state is LoggedIn) {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                } else if (state is LoginFailed) {
                  showErrorToast(state.error.message);
                }
              },
              child: Container(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder(
                bloc: _authBloc,
                builder: (BuildContext context, AuthState state) {
                  if (state is LoggingIn) {
                    return _buildLoadingIndicator();
                  }

                  return Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 16.0),
                        child: _buildTitle(context),
                      ),
                      _buildLoginForm(context),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }
}
