import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:violencia_cero/src/models/register_model.dart';
import 'package:violencia_cero/src/models/success_model.dart';
import 'package:violencia_cero/src/providers/auth_provider.dart';

import 'package:violencia_cero/src/utils/utils.dart' as utils;
import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final authProvider = new AuthProvider();

  bool _load = false;
  bool _acceptConditios = false;

  TextEditingController passwordCtrl = new TextEditingController();

  Register register = new Register();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.purple[300],
      ),
      body: Stack(children: [
        _fondoDecoration(sizeScreen),
        _registerForm(),
      ]),
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

  Widget _registerForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            _nameField(),
            //SizedBox(height: 10.0),
            //_lastNamePField(),
            //SizedBox(height: 10.0),
            //_lastNameMField(),
            //SizedBox(height: 10.0),
            //_phoneField(),
            SizedBox(height: 10.0),
            _emailField(),
            SizedBox(height: 10.0),
            _passwordField(),
            SizedBox(height: 10.0),
            _passwordValidateField(),
            SizedBox(height: 10.0),
            _cpField(),
            SizedBox(height: 20.0),
            _termsConditions(),
            SizedBox(height: 20.0),
            _registerButton(),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return Container(
      child: TextFormField(
        autofocus: true,
        initialValue: register.nombre,
        decoration: InputDecoration(
          labelText: 'Nombre(s) o Seudónimo',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            value.length < 3 ? 'Ingrese un Nombre Valido' : null,
        onSaved: (value) => register.nombre = value,
      ),
    );
  }

  Widget _lastNamePField() {
    return Container(
      child: TextFormField(
        initialValue: register.apellidoP,
        decoration: InputDecoration(
          labelText: 'Apellido Paterno',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            value.length < 3 ? 'Ingrese un Apellido Valido' : null,
        onSaved: (value) => register.apellidoP = value,
      ),
    );
  }

  Widget _lastNameMField() {
    return Container(
      child: TextFormField(
        initialValue: register.apellidoM,
        decoration: InputDecoration(
          labelText: 'Apellido Materno',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            value.length < 3 ? 'Ingrese un Apellido Valido' : null,
        onSaved: (value) => register.apellidoM = value,
      ),
    );
  }

  Widget _phoneField() {
    return Container(
      child: TextFormField(
        initialValue: register.tel,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Teléfono',
          icon: Icon(
            Icons.phone,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) {
          if (!utils.isNumeric(value)) {
            return 'Solo se aceptan numeros';
          }
          if (value.length < 8) {
            return 'Ingrese un Numero Valido';
          }
          return null;
        },
        onSaved: (value) => register.tel = value,
      ),
    );
  }

  Widget _emailField() {
    return Container(
      child: TextFormField(
        initialValue: register.email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'email',
          icon: Icon(
            Icons.alternate_email,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            utils.isEmail(value) ? null : 'Ingrese un email Valido',
        onSaved: (value) => register.email = value,
      ),
    );
  }

  Widget _passwordField() {
    return Container(
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
        onSaved: (value) => register.password = value,
      ),
    );
  }

  Widget _passwordValidateField() {
    return Container(
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

  Widget _cpField() {
    return Container(
      child: TextFormField(
        initialValue: register.cp,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Codigo Postal',
          icon: Icon(
            Icons.mail,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) {
          if (!utils.isNumeric(value)) {
            return 'Solo se aceptan numeros';
          }
          if (value.length != 5) {
            return 'Ingrese un C.P. Valido';
          }
          return null;
        },
        onSaved: (value) => register.cp = value,
      ),
    );
  }

  Widget _termsConditions() {
    TextStyle defaultStyle = TextStyle(color: Colors.black54, fontSize: 16.0);
    TextStyle linkStyle = TextStyle(color: Colors.blue);
    return Container(
      child: CheckboxListTileFormField(
        initialValue: _acceptConditios,
        title: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: defaultStyle,
            children: <TextSpan>[
              TextSpan(
                  text: 'He leído y acepto los términos y condiciones del '),
              TextSpan(
                text: 'aviso de privacidad ',
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launch(
                      'https://www.milpa-alta.cdmx.gob.mx/avisoprivacidadDH.pdf'),
              ),
              TextSpan(text: 'sobre el uso de esta aplicación.'),
            ],
          ),
        ),
        onSaved: (value) {
          setState(() {
            _acceptConditios = value;
          });
        },
        validator: (value) => value ? null : 'aceptar aviso de privacidad',
      ),
    );
  }

  Widget _registerButton() {
    return RaisedButton(
      color: Colors.purple[300],
      child: Container(
        child: Text(
          'Registrarme',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      onPressed: () => _load ? null : _sendData(),
    );
  }

  void _sendData() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    setState(() {
      _load = true;
    });
    final resp = authProvider.register(register);

    resp.then((response) {
      if (response.status) {
        final DataSuccess success = new DataSuccess(
            message: 'Registro exitoso',
            route1: 'inicio',
            route2: 'solicitante');
        Navigator.pushReplacementNamed(context, 'success', arguments: success);
      } else {
        utils.showAlert(context, 'Error', response.message);
      }
    });
  }
}
