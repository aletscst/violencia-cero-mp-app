import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/forgot_password_model.dart';
import 'package:violencia_cero/src/models/success_model.dart';
import 'package:violencia_cero/src/providers/fotgot_password_provider.dart';

import 'package:violencia_cero/src/utils/utils.dart' as utils;
import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class UpdatePasswordPage extends StatefulWidget {
  @override
  _UpdatePasswordPage createState() => _UpdatePasswordPage();
}

class _UpdatePasswordPage extends State<UpdatePasswordPage> {
  final formKey = GlobalKey<FormState>();
  final forgotPswProvider = new ForgotPasswordProvider();
  bool _load = false;
  TextEditingController passwordCtrl = new TextEditingController();

  UpdatePassword updatePws = new UpdatePassword();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    updatePws = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          _fondoDecoration(sizeScreen),
          _formCode(context, sizeScreen)
        ],
      ),
      bottomNavigationBar: var_utils.phoneBar,
    );
  }

  Widget _fondoDecoration(Size sizeScreen) {
    return Container(
      height: sizeScreen.height - 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _formCode(BuildContext context, Size sizeScreen) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: sizeScreen.height * 0.06),
            Container(
              child: Material(
                elevation: 12.0,
                shape: CircleBorder(),
                child: Image(
                  width: 125.0,
                  image: AssetImage('assets/images/principal1.png'),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Actualice su contraseña',
              style: TextStyle(fontSize: 30.0, color: Colors.purple[300]),
            ),
            SizedBox(height: 50.0),
            _passwordField(),
            SizedBox(height: 50.0),
            _passwordValidateField(),
            SizedBox(height: 50.0),
            _updatePassword(context),
          ],
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        obscureText: true,
        controller: passwordCtrl,
        decoration: InputDecoration(
          labelText: 'Contraseña',
          icon: Icon(
            Icons.lock_outline,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 6
            ? 'Ingrese una contraseña mayor a 6 caracteres'
            : null,
        onSaved: (value) => updatePws.password = value,
      ),
    );
  }

  Widget _passwordValidateField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Confirma tu contraseña',
          icon: Icon(
            Icons.lock_outline,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            passwordCtrl.text != value ? 'Las contraseñas no coinciden' : null,
      ),
    );
  }

  Widget _updatePassword(BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Text(
          'Cambiar contraseña',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      color: Color.fromRGBO(244, 99, 212, 1.0),
      textColor: Colors.white,
      onPressed: () => _load ? null : _send(),
    );
  }

  _send() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    setState(() {
      _load = true;
    });
    final resp = forgotPswProvider.updatePassword(updatePws);
    resp.then((value) {
      if (value["status"]) {
        final DataSuccess success = new DataSuccess(
          message: 'Contraseña actualizada correctamente',
          route1: 'inicio',
          route2: 'login',
        );
        Navigator.pushReplacementNamed(context, 'success', arguments: success);
      } else {
        utils.showAlert(context, 'error', value["message"]);
        setState(() {
          _load = false;
        });
      }
    });
  }
}
