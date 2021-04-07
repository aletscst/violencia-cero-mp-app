import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/info_violencia_model.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class TiposViolenciaPage extends StatelessWidget {
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
          _fondo(sizeScreen),
          SingleChildScrollView(
            child: _elements(sizeScreen, context),
          )
        ],
      ),
      bottomNavigationBar: var_utils.phoneBar,
    );
  }

  Widget _fondo(Size siseScreen) {
    return Container(
      height: siseScreen.height - 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondoTiposViolencia.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _elements(Size sizeScreen, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: sizeScreen.height * 0.05,
      ),
      child: Column(children: [
        Container(
          child: Text(
            'Tipos de violencia',
            style: TextStyle(
              fontSize: 30.0,
              color: Color.fromRGBO(97, 71, 197, 1.0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: sizeScreen.height * 0.04,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _rowLeft(context, sizeScreen),
              _rowRight(context, sizeScreen),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _rowLeft(BuildContext context, Size sizeScreen) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-digital.png'),
            ),
            onPressed: () {
              final info = {
                'id': 1,
                'title': 'Violencia Digital',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-patrimonial.png'),
            ),
            onPressed: () {
              final info = {
                'id': 3,
                'title': 'Violencia Patrimonial',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-sexual.png'),
            ),
            onPressed: () {
              final info = {
                'id': 5,
                'title': 'Violencia Sexual',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-feminicida.png'),
            ),
            onPressed: () {
              final info = {
                'id': 7,
                'title': 'Violencia Feminicida',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-emocional.png'),
            ),
            onPressed: () {
              final info = {
                'id': 9,
                'title': 'Violencia Psicoemocional',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          )
        ],
      ),
    );
  }

  Widget _rowRight(BuildContext context, Size sizeScreen) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.3,
              image: AssetImage('assets/images/principal2.png'),
            ),
            onPressed: () => null,
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-fisica.png'),
            ),
            onPressed: () {
              final info = {
                'id': 2,
                'title': 'Violencia Física',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-economica.png'),
            ),
            onPressed: () {
              final info = {
                'id': 4,
                'title': 'Violencia Económica',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-reproductivo.png'),
            ),
            onPressed: () {
              final info = {
                'id': 6,
                'title': 'Violencia contra los Derechos Reproductivos',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-simbolica.png'),
            ),
            onPressed: () {
              final info = {
                'id': 8,
                'title': 'Violencia Simbólica',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violencia-parto.png'),
            ),
            onPressed: () {
              final info = {
                'id': 10,
                'title': 'Violencia en la gestación, parto o lactancia',
              };
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          )
        ],
      ),
    );
  }
}
