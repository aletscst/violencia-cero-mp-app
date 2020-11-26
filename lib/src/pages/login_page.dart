import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/login_model.dart';
import 'package:violencia_cero/src/providers/auth_provider.dart';
import 'package:violencia_cero/src/share_prefs/user_preferences.dart';

import 'package:violencia_cero/src/utils/utils.dart' as utils;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final prefs = new UserPreferences();
  final authProvider = AuthProvider();
  Login _login = new Login();

  @override
  void initState() {
    super.initState();
    print(prefs.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(context),
    );
  }

  Widget _loginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: 100.0,
              ),
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 30.0, color: Colors.purple[300]),
            ),
            Text(
              'Para levantar una denuncia por favor inicia sesion',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 50.0),
            _emailField(),
            SizedBox(height: 30.0),
            _passrowdField(),
            SizedBox(height: 30.0),
            _loginButton(context),
            SizedBox(height: 10.0),
            _registerButton(context),
            SizedBox(height: 10.0),
            _forgontPasswordButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.alternate_email,
            color: Colors.purple[300],
          ),
          labelText: 'Correo Electronico',
        ),
        validator: (value) => value.contains('@') ? null : 'email invalido',
        onSaved: (value) => _login.email = value,
      ),
    );
  }

  Widget _passrowdField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.purple[300],
          ),
          labelText: 'contraseña',
        ),
        validator: (value) => value.length < 6
            ? 'Ingrese una contraseña mayor a 6 caracteres'
            : null,
        onSaved: (value) => _login.password = value,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Text('Ingresar'),
      ),
      color: Colors.purple[300],
      textColor: Colors.white,
      onPressed: () {
        if (!formKey.currentState.validate()) return;
        formKey.currentState.save();
        final resp = authProvider.login(_login);
        resp.then((value) {
          if (value["status"]) {
            prefs.token = value["token"];
            prefs.userId = value["id"];

            Navigator.pushReplacementNamed(context, 'solicitante');
          } else {
            utils.showAlert(context, 'error', value["message"]);
          }
        });
      },
    );
  }

  Widget _registerButton(BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Text('Registrate'),
      ),
      color: Colors.white,
      textColor: Colors.purple[300],
      elevation: 0.0,
      onPressed: () {
        Navigator.pushNamed(context, 'register');
      },
    );
  }

  Widget _forgontPasswordButton() {
    return RaisedButton(
      child: Container(
        child: Text('Olvide mi contraseña'),
      ),
      color: Colors.white,
      textColor: Colors.purple[300],
      elevation: 0.0,
      onPressed: () {},
    );
  }
}
