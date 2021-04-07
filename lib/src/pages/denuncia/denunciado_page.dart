import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/report_model.dart';

import 'package:violencia_cero/src/utils/utils.dart' as utils;
import 'package:violencia_cero/src/utils/variables_utils.dart'
    as variable_utils;

class DenunciadoPage extends StatefulWidget {
  @override
  _DenunciadoPageState createState() => _DenunciadoPageState();
}

class _DenunciadoPageState extends State<DenunciadoPage> {
  final formKey = GlobalKey<FormState>();
  String _genderOpc = '';

  final Report _report = new Report();
  final denunciado = new Denunciado();
  String _relationshipOpc = '';
  List<String> _violenceSelect = [];

  @override
  Widget build(BuildContext context) {
    _report.solicitante = ModalRoute.of(context).settings.arguments;
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Persona Señalada de Violentar'),
        backgroundColor: Colors.purple[300],
      ),
      body: Stack(
        children: [
          _fondoDecoration(sizeScreen),
          _denunciadoForm(),
        ],
      ),
      bottomNavigationBar: variable_utils.phoneBar,
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
            _gender(),
            SizedBox(height: 10.0),
            _specificGender(),
            SizedBox(height: 10.0),
            //_lastNameP(),
            //SizedBox(height: 10.0),
            //_lastNameM(),
            //SizedBox(height: 10.0),
            //_relationship(),
            //SizedBox(height: 10.0),
            //_specificRelationship(),
            //SizedBox(height: 10.0),
            _age(),
            SizedBox(height: 20.0),
            //_employment(),
            //SizedBox(height: 10.0),
            //_adress(),
            //SizedBox(height: 10.0),
            //_cp(),
            //SizedBox(height: 10.0),
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
          labelText: 'Nombre(s) o seudónimo:',
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
          labelText: 'Edad aproximada',
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
          labelText: 'Domicilio Actual',
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
        validator: (value) {
          if (!utils.isNumeric(value)) {
            return 'Solo se aceptan numeros';
          }
          if (value.length != 5) {
            return 'Ingrese un Numero Valido';
          }
          return null;
        },
        onSaved: (value) => denunciado.codigoPostal = value,
      ),
    );
  }

  Widget _gender() {
    return Container(
      padding: EdgeInsets.only(right: 150.0),
      child: DropdownButtonFormField(
        value: 'Hombre',
        decoration: InputDecoration(
          labelText: 'Genero',
          icon: Icon(
            Icons.wc,
            color: Colors.purple[300],
          ),
        ),
        items: ['Mujer', 'Hombre', 'Otro']
            .map((gender) => DropdownMenuItem(
                  child: Text(gender),
                  value: gender,
                ))
            .toList(),
        onChanged: (value) {
          if (value != 'Otro') {
            denunciado.genero = value;
          }
          setState(() {
            _genderOpc = value;
          });
        },
      ),
    );
  }

  Widget _specificGender() {
    return Visibility(
      visible: _genderOpc == 'Otro',
      child: TextFormField(
        initialValue: denunciado.genero,
        decoration: InputDecoration(
          labelText: 'Especifique Genero',
          icon: Icon(
            Icons.wc,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 3 ? 'Campo Obligatorio' : null,
        onSaved: (value) => denunciado.genero = value,
      ),
    );
  }

  Widget _violenceType() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '¿Qué tipo de violencia ejerció?',
            style: TextStyle(fontSize: 17.0),
          ),
          CheckboxListTile(
            title: Text('Violencia digital'),
            value: _violenceSelect.contains('Violencia digital'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Violencia digital');
                else
                  _violenceSelect.remove('Violencia digital');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia Física'),
            value: _violenceSelect.contains('Violencia Física'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Violencia Física');
                else
                  _violenceSelect.remove('Violencia Física');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia Patrimonial'),
            value: _violenceSelect.contains('Violencia Patrimonial'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Violencia Patrimonial');
                else
                  _violenceSelect.remove('Violencia Patrimonial');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia Económica'),
            value: _violenceSelect.contains('Violencia Económica'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Violencia Económica');
                else
                  _violenceSelect.remove('Violencia Económica');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia Sexual'),
            value: _violenceSelect.contains('Violencia Sexual'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Violencia Sexual');
                else
                  _violenceSelect.remove('Violencia Sexual');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia contra los Derechos Reproductivos'),
            value: _violenceSelect
                .contains('Violencia contra los Derechos Reproductivos'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect
                      .add('Violencia contra los Derechos Reproductivos');
                else
                  _violenceSelect
                      .remove('Violencia contra los Derechos Reproductivos');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia Feminicida'),
            value: _violenceSelect.contains('Violencia Feminicida'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Violencia Feminicida');
                else
                  _violenceSelect.remove('Violencia Feminicida');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia Psicoemocional'),
            value: _violenceSelect.contains('Violencia Psicoemocional'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Violencia Psicoemocional');
                else
                  _violenceSelect.remove('Violencia Psicoemocional');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia Simbólica'),
            value: _violenceSelect.contains('Violencia Simbólica'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect.add('Violencia Simbólica');
                else
                  _violenceSelect.remove('Violencia Simbólica');
              });
            },
          ),
          CheckboxListTile(
            title: Text('Violencia en la Gestación, Parto o Lactancia'),
            value: _violenceSelect
                .contains('Violencia en la Gestación, Parto o Lactancia'),
            onChanged: (select) {
              setState(() {
                if (select)
                  _violenceSelect
                      .add('Violencia en la Gestación, Parto o Lactancia');
                else
                  _violenceSelect
                      .remove('Violencia en la Gestación, Parto o Lactancia');
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
