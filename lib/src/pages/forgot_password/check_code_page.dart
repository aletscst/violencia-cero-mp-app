import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/forgot_password_model.dart';
import 'package:violencia_cero/src/providers/fotgot_password_provider.dart';

import 'package:violencia_cero/src/utils/utils.dart' as utils;
import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class CheckCodePage extends StatefulWidget {
  @override
  _CheckCodePageState createState() => _CheckCodePageState();
}

class _CheckCodePageState extends State<CheckCodePage> {
  final formKey = GlobalKey<FormState>();
  final forgotPswProvider = new ForgotPasswordProvider();
  String _email = '';
  String _code = '';
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    _email = ModalRoute.of(context).settings.arguments;
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
              'Ingrese el codigo',
              style: TextStyle(fontSize: 30.0, color: Colors.purple[300]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'si no recibio el codigo regrese a la pantalla anterior y envie de nuevo el correo',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 50.0),
            _codeField(),
            SizedBox(height: 50.0),
            _sendEmail(context)
          ],
        ),
      ),
    );
  }

  Widget _codeField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Ingresa el codigo que recibiste en tu correo',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        onSaved: (value) => _code = value,
      ),
    );
  }

  Widget _sendEmail(BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Text(
          'Verificar codigo',
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
    final resp = forgotPswProvider.checkCode(_email, _code);
    resp.then((value) {
      if (value["status"]) {
        final UpdatePassword data = new UpdatePassword(
          id: value["id"],
          code: _code,
          email: _email,
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
            'updatepassword', ModalRoute.withName('sendcode'),
            arguments: data);
      } else {
        utils.showAlert(context, 'error', value["message"]);
        setState(() {
          _load = false;
        });
      }
    });
  }
}
