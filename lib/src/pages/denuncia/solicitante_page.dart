import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/report_model.dart';

import 'package:violencia_cero/src/utils/utils.dart' as utils;
import 'package:violencia_cero/src/utils/variables_utils.dart'
    as variable_utils;

class SolicitantePage extends StatefulWidget {
  @override
  _SolicitantePageState createState() => _SolicitantePageState();
}

class _SolicitantePageState extends State<SolicitantePage> {
  final formKey = GlobalKey<FormState>();

  final Solicitante solicitante = new Solicitante();

  String _genderOpc = '';
  String _scholarshipOpc = '';
  String _maritalStatusOpc = '';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos del Solicitante'),
        backgroundColor: Colors.purple[300],
      ),
      body: Stack(children: [
        _fondoDecoration(sizeScreen),
        _solicitanteForm(),
      ]),
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

  Widget _solicitanteForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 10.0),
            _name(),
            SizedBox(height: 10.0),
            _lastNameP(),
            SizedBox(height: 10.0),
            _lastNameM(),
            SizedBox(height: 10.0),
            _gender(),
            SizedBox(height: 10.0),
            _specificGender(),
            SizedBox(height: 10.0),
            _age(),
            SizedBox(height: 10.0),
            _tel(),
            SizedBox(height: 10.0),
            _birthPlace(),
            SizedBox(height: 10.0),
            _adress(),
            SizedBox(height: 10.0),
            _cp(),
            SizedBox(height: 10.0),
            _scholarship(),
            SizedBox(height: 10.0),
            _specificScolarShip(),
            SizedBox(height: 10.0),
            _maritalStatus(),
            SizedBox(height: 10.0),
            _specificMaritalStatus(),
            SizedBox(height: 10.0),
            _employment(),
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
        initialValue: solicitante.nombres,
        decoration: InputDecoration(
          labelText: 'Nombre',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            value.length < 3 ? 'Ingrese un Nombre Valido' : null,
        onSaved: (value) => solicitante.nombres = value,
      ),
    );
  }

  Widget _lastNameP() {
    return Container(
      child: TextFormField(
        initialValue: solicitante.apellidoPaterno,
        decoration: InputDecoration(
          labelText: 'Apellido Paterno',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            value.length < 3 ? 'Ingrese un Apellido Valido' : null,
        onSaved: (value) => solicitante.apellidoPaterno = value,
      ),
    );
  }

  Widget _lastNameM() {
    return Container(
      child: TextFormField(
        initialValue: solicitante.apellidoMaterno,
        decoration: InputDecoration(
          labelText: 'Apellido Materno',
          icon: Icon(
            Icons.account_circle,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) =>
            value.length < 3 ? 'Ingrese un Apellido Valido' : null,
        onSaved: (value) => solicitante.apellidoMaterno = value,
      ),
    );
  }

  Widget _gender() {
    return Container(
      padding: EdgeInsets.only(right: 150.0),
      child: DropdownButtonFormField(
        value: 'Mujer',
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
            solicitante.genero = value;
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
        initialValue: solicitante.genero,
        decoration: InputDecoration(
          labelText: 'Especifique Genero',
          icon: Icon(
            Icons.wc,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 3 ? 'Campo Obligatorio' : null,
        onSaved: (value) => solicitante.genero = value,
      ),
    );
  }

  Widget _age() {
    return Container(
      padding: EdgeInsets.only(right: 200.0),
      child: DropdownButtonFormField(
        value: solicitante.edad.toString(),
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
            solicitante.edad = int.parse(value);
          });
        },
      ),
    );
  }

  Widget _tel() {
    return Container(
      child: TextFormField(
        initialValue: solicitante.telefono,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Telefono',
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
        onSaved: (value) => solicitante.telefono = value,
      ),
    );
  }

  Widget _birthPlace() {
    return Container(
      padding: EdgeInsets.only(right: 35.0),
      child: DropdownButtonFormField(
        value: solicitante.lugarNacimiento,
        decoration: InputDecoration(
          labelText: 'Lugar de Nacimiento',
          icon: Icon(
            Icons.apartment,
            color: Colors.purple[300],
          ),
        ),
        items: variable_utils.states
            .map(
              (state) =>
                  DropdownMenuItem<String>(child: Text(state), value: state),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            solicitante.lugarNacimiento = value;
          });
        },
      ),
    );
  }

  Widget _adress() {
    return Container(
      child: TextFormField(
        initialValue: solicitante.domicilio,
        maxLines: 2,
        decoration: InputDecoration(
          labelText: 'Domicilio Actial',
          icon: Icon(
            Icons.house,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 3 ? 'Campo obligatorio' : null,
        onSaved: (value) => solicitante.domicilio = value,
      ),
    );
  }

  Widget _cp() {
    return Container(
      child: TextFormField(
        initialValue: solicitante.codigoPostal,
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
        onSaved: (value) => solicitante.codigoPostal = value,
      ),
    );
  }

  ////escolaridad/////
  Widget _scholarship() {
    return Container(
      padding: EdgeInsets.only(right: 150.0),
      child: DropdownButtonFormField(
        value: 'Primaria',
        decoration: InputDecoration(
          labelText: 'Escolaridad',
          icon: Icon(
            Icons.school,
            color: Colors.purple[300],
          ),
        ),
        items: variable_utils.scolarships
            .map((scholar) => DropdownMenuItem(
                  child: Text(scholar),
                  value: scholar,
                ))
            .toList(),
        onChanged: (value) {
          if (value != 'Otro') {
            solicitante.escolaridad = value;
          }
          setState(() {
            _scholarshipOpc = value;
          });
        },
      ),
    );
  }

  Widget _specificScolarShip() {
    return Visibility(
      visible: _scholarshipOpc == 'Otro',
      child: TextFormField(
        initialValue: solicitante.escolaridad,
        decoration: InputDecoration(
          labelText: 'Especifique la Escolaridad',
          icon: Icon(
            Icons.school,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 3 ? 'Campo Obligatorio' : null,
        onSaved: (value) => solicitante.escolaridad = value,
      ),
    );
  }

  ///Estado civil///

  Widget _maritalStatus() {
    return Container(
      padding: EdgeInsets.only(right: 150.0),
      child: DropdownButtonFormField(
        value: 'Soltera(o)',
        decoration: InputDecoration(
          labelText: 'Estado Civil',
          icon: Icon(
            Icons.family_restroom,
            color: Colors.purple[300],
          ),
        ),
        items: variable_utils.maritaStatus
            .map((status) => DropdownMenuItem(
                  child: Text(status),
                  value: status,
                ))
            .toList(),
        onChanged: (value) {
          if (value != 'Otro') {
            solicitante.edoCivil = value;
          }
          setState(() {
            _maritalStatusOpc = value;
          });
        },
      ),
    );
  }

  Widget _specificMaritalStatus() {
    return Visibility(
      visible: _maritalStatusOpc == 'Otro',
      child: TextFormField(
        initialValue: solicitante.edoCivil,
        decoration: InputDecoration(
          labelText: 'Especifique su Estado Civil',
          icon: Icon(
            Icons.family_restroom,
            color: Colors.purple[300],
          ),
        ),
        validator: (value) => value.length < 3 ? 'Campo Obligatorio' : null,
        onSaved: (value) => solicitante.edoCivil = value,
      ),
    );
  }

  Widget _employment() {
    return Container(
      child: TextFormField(
        initialValue: solicitante.ocupacion,
        decoration: InputDecoration(
          labelText: 'Ocupacion',
          icon: Icon(
            Icons.work,
            color: Colors.purple[300],
          ),
        ),
        onSaved: (value) => solicitante.ocupacion = value,
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

    Navigator.pushNamed(context, 'denunciado', arguments: solicitante);
  }
}
