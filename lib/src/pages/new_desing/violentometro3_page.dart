import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class Violentometro3Page extends StatelessWidget {
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
          _fondo(context),
          _elements(sizeScreen, context),
        ],
      ),
      bottomNavigationBar: var_utils.phoneBar,
    );
  }

  Widget _fondo(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: sizeScreen.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(102, 45, 145, 1.0),
            Color.fromRGBO(102, 45, 145, 1.0),
            Color.fromRGBO(27, 20, 100, 1.0),
          ],
        ),
      ),
    );
  }

  Widget _elements(Size sizeScreen, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: sizeScreen.height * 0.05),
        child: Column(
          children: _fillItems(context),
        ),
      ),
    );
  }

  List<Widget> _fillItems(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    final List<String> data = [
      'Amenaza con objetos o armas     21 __',
      'Amenazar de muerte     22 __',
      'Forzar relacion sexual     23 __',
      'Abuso sexual     24 __',
      'Violar     25 __',
      'Mutilar     26 __',
      'Asesinar     27 __',
    ];

    List<Widget> lista = new List<Widget>();

    lista.add(_headerText());
    lista.add(_headerSubText());
    lista.add(_headerNumText());
    lista.add(_warnigText());

    data.forEach((element) {
      lista.add(ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
        title: Text(
          element,
          textAlign: TextAlign.end,
          style: textStyle,
        ),
      ));
    });

    final button = Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: Icon(Icons.arrow_back),
            backgroundColor: Color.fromRGBO(102, 45, 145, 1.0),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );

    lista.add(button);
    return lista;
  }

  Widget _headerText() {
    return Container(
      child: Text(
        'Violentómentro',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _headerSubText() {
    return Container(
      child: Text(
        'Línea Mujeres de locatel',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
    );
  }

  Widget _headerNumText() {
    return Container(
      child: RaisedButton.icon(
        elevation: 10.0,
        icon: Icon(
          Icons.phone,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Color.fromRGBO(27, 20, 100, 1.0),
        label: Text(
          '55 56 58 11 11',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => {launch('tel:5556581111')},
      ),
    );
  }

  Widget _warnigText() {
    return Container(
      child: Text(
        '¡NECESITAS AYUDA PROFESIONAL!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
