import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/report_model.dart';
import 'package:violencia_cero/src/models/success_model.dart';
import 'package:violencia_cero/src/providers/report_provider.dart';

import 'package:violencia_cero/src/utils/utils.dart' as utils;

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final formKey = GlobalKey<FormState>();
  final reportProvider = new ReportProvider();

  List<String> _helpOpc = [];

  Report _report;

  @override
  Widget build(BuildContext context) {
    _report = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Denuncia'),
        backgroundColor: Colors.purple[300],
      ),
      body: _reportForm(),
    );
  }

  Widget _reportForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 10.0),
            _problem(),
            SizedBox(height: 10.0),
            _help(),
            SizedBox(height: 20.0),
            _registerButton(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _problem() {
    return Container(
      child: TextFormField(
        initialValue: _report.descripcionProblema,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: 'Describe tu problema',
          icon: Icon(
            Icons.speaker_notes,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 3 ? 'Campo obligatorio' : null,
        onSaved: (value) => _report.descripcionProblema = value,
      ),
    );
  }

  Widget _help() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '¿Que tipo de Ayuda Necesitas?',
            style: TextStyle(fontSize: 17.0),
          ),
          CheckboxListTile(
            title: Text('Jurídica'),
            value: _helpOpc.contains('Jurídica'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _helpOpc.add('Jurídica');
                else
                  _helpOpc.remove('Jurídica');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Psicológica'),
            value: _helpOpc.contains('Psicológica'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _helpOpc.add('Psicológica');
                else
                  _helpOpc.remove('Psicológica');
              });
            },
          ),
          TextFormField(
            initialValue: _report.tipoAyuda,
            decoration: InputDecoration(
              labelText: 'Otro',
              icon: Icon(
                Icons.contact_support,
                color: Colors.purple[300],
              ),
            ),
            onSaved: (value) => _report.tipoAyuda = value,
          ),
        ],
      ),
    );
  }

  Widget _registerButton() {
    return RaisedButton(
      color: Colors.purple[300],
      child: Container(
        child: Text(
          'Enviar',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      onPressed: () {
        _send();
      },
    );
  }

  void _send() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();

    String help = '';

    _helpOpc.forEach((element) {
      help += '$element, ';
    });

    _report.tipoAyuda = help + _report.tipoAyuda;

    final resp = reportProvider.postReport(_report);

    resp.then((response) {
      if (response.status) {
        final DataSuccess success = new DataSuccess(
            message: 'Denuncia Envida, Nos comunicaremos contigo pronto',
            route1: 'home',
            route2: 'home');
        Navigator.pushReplacementNamed(context, 'success', arguments: success);
      } else {
        utils.showAlert(context, 'Error', response.message);
      }
    });
  }
}
