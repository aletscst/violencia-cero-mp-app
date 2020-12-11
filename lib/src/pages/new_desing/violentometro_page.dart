import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class ViolentometroPage extends StatelessWidget {
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
            Color.fromRGBO(241, 90, 36, 1.0),
            Color.fromRGBO(241, 90, 36, 1.0),
            Color.fromRGBO(250, 165, 56, 1.0),
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
      'Bromas hirientes     1 __',
      'Chantajeos     2 __',
      'Mentir/Engañar     3 __',
      'Ignorar/Ley del hielo     4 __',
      'Celar     5 __',
      'Culpabilizar     6 __',
      'Descalificar     7 __',
      'Ridiculizar/Ofender     8 __',
      'Humillar en publico     9 __',
      'Intimidar/Amenazar    10 __',
      'Controlar/Prohibir    11 __',
    ];

    List<Widget> lista = new List<Widget>();
    lista.add(_headerText());
    lista.add(_headerSubText());
    lista.add(_headerNumText());
    lista.add(_warnigText());
    lista.add(_warnigSubText());

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
            child: Icon(Icons.arrow_forward),
            backgroundColor: Color.fromRGBO(241, 90, 36, 1.0),
            onPressed: () => Navigator.pushNamed(context, 'violentometro2'),
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
        color: Colors.orange[500],
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
        '¡TEN CUIDADO!',
        style: TextStyle(
          color: Color.fromRGBO(250, 165, 56, 1.0),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _warnigSubText() {
    return Container(
      child: Text(
        'La violencia AUMENTARÁ',
        style: TextStyle(
          color: Color.fromRGBO(250, 165, 56, 1.0),
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
