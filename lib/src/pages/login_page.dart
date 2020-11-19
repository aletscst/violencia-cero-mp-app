import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(context),
    );
  }

  Widget _loginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
            _loginButton(),
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
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.alternate_email,
              color: Colors.purple[300],
            ),
            labelText: 'Correo Electronico'),
      ),
    );
  }

  Widget _passrowdField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.purple[300],
          ),
          labelText: 'contraseña',
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RaisedButton(
      child: Container(
        child: Text('Ingresar'),
      ),
      color: Colors.purple[300],
      textColor: Colors.white,
      onPressed: () {},
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
