import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/report_model.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart'
    as variable_utils;

class DenunciadoPage extends StatefulWidget {
  @override
  _DenunciadoPageState createState() => _DenunciadoPageState();
}

class _DenunciadoPageState extends State<DenunciadoPage> {
  final formKey = GlobalKey<FormState>();

  final Report _report = new Report();
  final denunciado = new Denunciado();
  String _relationshipOpc = '';
  List<String> _violenceSelect = [];

  @override
  Widget build(BuildContext context) {
    _report.solicitante = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Persona Señalada de Violentar'),
        backgroundColor: Colors.purple[300],
      ),
      body: _denunciadoForm(),
    );
  }

  Widget _denunciadoForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            _name(),
            SizedBox(height: 10.0),
            _lastNameP(),
            SizedBox(height: 10.0),
            _lastNameM(),
            SizedBox(height: 10.0),
            _relationship(),
            SizedBox(height: 10.0),
            _specificRelationship(),
            SizedBox(height: 10.0),
            _age(),
            SizedBox(height: 10.0),
            _employment(),
            SizedBox(height: 10.0),
            _adress(),
            SizedBox(height: 10.0),
            _cp(),
            SizedBox(height: 10.0),
            _violenceType(),
            SizedBox(height: 20.0),
            _registerButton(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _name() {
    return Container(
      child: TextFormField(
        initialValue: denunciado.nombres,
        decoration: InputDecoration(
          labelText: 'Nombre',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            value.length < 3 ? 'Ingrese un Nombre Valido' : null,
        onSaved: (value) => denunciado.nombres = value,
      ),
    );
  }

  Widget _lastNameP() {
    return Container(
      child: TextFormField(
        initialValue: denunciado.apellidoPaterno,
        decoration: InputDecoration(
          labelText: 'Apellido Paterno',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        onSaved: (value) => denunciado.apellidoPaterno = value,
      ),
    );
  }

  Widget _lastNameM() {
    return Container(
      child: TextFormField(
        initialValue: denunciado.apellidoMaterno,
        decoration: InputDecoration(
          labelText: 'Apellido Materno',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        onSaved: (value) => denunciado.apellidoMaterno = value,
      ),
    );
  }

  Widget _relationship() {
    return Container(
      padding: EdgeInsets.only(right: 150.0),
      child: DropdownButtonFormField(
        value: 'Padre',
        decoration: InputDecoration(
          labelText: 'Parentesco',
          icon: Icon(
            Icons.recent_actors,
            color: Colors.purple[300],
          ),
        ),
        items: variable_utils.relationship
            .map((relation) => DropdownMenuItem(
                  child: Text(relation),
                  value: relation,
                ))
            .toList(),
        onChanged: (value) {
          if (value != 'Otro') {
            denunciado.parentesco = value;
          }
          setState(() {
            _relationshipOpc = value;
          });
        },
      ),
    );
  }

  Widget _specificRelationship() {
    return Visibility(
      visible: _relationshipOpc == 'Otro',
      child: TextFormField(
        initialValue: denunciado.parentesco,
        decoration: InputDecoration(
          labelText: 'Especifique la el Parentesco',
          icon: Icon(
            Icons.recent_actors,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 3 ? 'Campo Obligatorio' : null,
        onSaved: (value) => denunciado.parentesco = value,
      ),
    );
  }

  Widget _age() {
    return Container(
      padding: EdgeInsets.only(right: 200.0),
      child: DropdownButtonFormField(
        value: denunciado.edad.toString(),
        decoration: InputDecoration(
          labelText: 'Edad',
          icon: Icon(
            Icons.calendar_today,
            color: Colors.purple[300],
          ),
        ),
        items: variable_utils.ages
            .map((age) => DropdownMenuItem(
                  child: Text(age.toString()),
                  value: age.toString(),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            denunciado.edad = int.parse(value);
          });
        },
      ),
    );
  }

  Widget _employment() {
    return Container(
      child: TextFormField(
        initialValue: denunciado.ocupacion,
        decoration: InputDecoration(
          labelText: 'Ocupacion',
          icon: Icon(
            Icons.work,
            color: Colors.purple[300],
          ),
        ),
        onSaved: (value) => denunciado.ocupacion = value,
      ),
    );
  }

  Widget _adress() {
    return Container(
      child: TextFormField(
        initialValue: denunciado.domicilio,
        maxLines: 2,
        decoration: InputDecoration(
          labelText: 'Domicilio Actial',
          icon: Icon(
            Icons.house,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 3 ? 'Campo obligatorio' : null,
        onSaved: (value) => denunciado.domicilio = value,
      ),
    );
  }

  Widget _cp() {
    return Container(
      child: TextFormField(
        initialValue: denunciado.codigoPostal,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'C.P.',
          icon: Icon(
            Icons.mail,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            value.length != 5 ? 'Ingrese un C.P. Valido' : null,
        onSaved: (value) => denunciado.codigoPostal = value,
      ),
    );
  }

  Widget _violenceType() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '¿Que tipo de Violencia ejercio?',
            style: TextStyle(fontSize: 17.0),
          ),
          CheckboxListTile(
            title: Text('Fisica'),
            value: _violenceSelect.contains('Fisica'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Fisica');
                else
                  _violenceSelect.remove('Fisica');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Sexual'),
            value: _violenceSelect.contains('Sexual'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Sexual');
                else
                  _violenceSelect.remove('Sexual');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Verbal'),
            value: _violenceSelect.contains('Verbal'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Verbal');
                else
                  _violenceSelect.remove('Verbal');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Psicologica'),
            value: _violenceSelect.contains('Psicologica'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Psicologica');
                else
                  _violenceSelect.remove('Psicologica');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Familiar'),
            value: _violenceSelect.contains('Familiar'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Familiar');
                else
                  _violenceSelect.remove('Familiar');
              });
            },
          ),
          TextFormField(
            initialValue: denunciado.tipoViolencia,
            decoration: InputDecoration(
              labelText: 'Otro',
              icon: Icon(
                Icons.sports_kabaddi,
                color: Colors.purple[300],
              ),
            ),
            onSaved: (value) => denunciado.tipoViolencia = value,
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
          'Siguiente',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      onPressed: () {
        _next();
      },
    );
  }

  void _next() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();

    String violence = '';

    _violenceSelect.forEach((element) {
      violence += '$element, ';
    });

    denunciado.tipoViolencia = violence + denunciado.tipoViolencia;

    _report.denunciado = denunciado;

    Navigator.pushNamed(context, 'report', arguments: _report);
  }
}
