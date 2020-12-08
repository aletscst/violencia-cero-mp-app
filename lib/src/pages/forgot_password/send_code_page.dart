import 'package:flutter/material.dart';
import 'package:violencia_cero/src/providers/fotgot_password_provider.dart';

import 'package:violencia_cero/src/utils/utils.dart' as utils;
import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class SendCodePage extends StatefulWidget {
  @override
  _SendCodePageState createState() => _SendCodePageState();
}

class _SendCodePageState extends State<SendCodePage> {
  final formKey = GlobalKey<FormState>();
  final forgotPswProvider = new ForgotPasswordProvider();
  String _email = '';
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          _fondoDecoration(sizeScreen),
          _formEmail(context, sizeScreen)
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

  Widget _formEmail(BuildContext context, Size sizeScreen) {
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
              'Olvide mi contraseña',
              style: TextStyle(fontSize: 30.0, color: Colors.purple[300]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Para crear una nueva contraseña se te enviara un codigo a tu correo',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 50.0),
            _emailField(),
            SizedBox(height: 50.0),
            _sendEmail(context)
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
        validator: (value) => utils.isEmail(value) ? null : 'email invalido',
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _sendEmail(BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Text(
          'Enviar',
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
    final resp = forgotPswProvider.getCodeEmail(_email);
    resp.then((value) {
      if (value["status"]) {
        Navigator.pushNamed(context, 'checkcode', arguments: _email);
      } else {
        utils.showAlert(context, 'error', value["message"]);
        setState(() {
          _load = false;
        });
      }
    });
  }
}
