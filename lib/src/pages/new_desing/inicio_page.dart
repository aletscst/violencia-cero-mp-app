import 'package:flutter/material.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _fondo(sizeScreen),
            _fondoDecoration(sizeScreen),
            _elements(sizeScreen, context),
          ],
        ),
      ),
      bottomNavigationBar: var_utils.phoneBar,
    );
  }

  Widget _fondo(Size sizeScreen) {
    return Container(
      height: sizeScreen.height * .4,
      width: sizeScreen.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment(0.0, 2.0),
          image: AssetImage('assets/images/fondoSup.png'),
          fit: BoxFit.cover,
        ),
      ),
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

  Widget _elements(Size sizeScreen, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: sizeScreen.height * 0.06),
      child: Column(
        children: [
          _logoVcero(),
          SizedBox(
            height: sizeScreen.height * 0.03,
          ),
          _imgVcero(),
          SizedBox(
            height: sizeScreen.height * 0.02,
          ),
          _welcomeText(),
          SizedBox(
            height: sizeScreen.height * 0.02,
          ),
          _entrarBtn(context),
          SizedBox(
            height: sizeScreen.height * 0.02,
          ),
          _alzaVoz(),
          SizedBox(
            height: sizeScreen.height * 0.04,
          ),
          _logGob(),
          SizedBox(
            height: sizeScreen.height * 0.04,
          ),
          _optionsMenu(context),
        ],
      ),
    );
  }

  Widget _logoVcero() {
    return Container(
      child: Image(
        width: 150.0,
        image: AssetImage('assets/images/vcero.png'),
      ),
    );
  }

  Widget _imgVcero() {
    return Container(
      child: Material(
        elevation: 12.0,
        shape: CircleBorder(),
        child: Image(
          width: 125.0,
          image: AssetImage('assets/images/principal1.png'),
        ),
      ),
    );
  }

  Widget _welcomeText() {
    return Container(
      child: Text(
        'Bienvenid@s',
        style: TextStyle(
            fontSize: 35.0,
            color: Color.fromRGBO(140, 99, 218, 1.0),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _entrarBtn(BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Text(
          'ENTRAR',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      color: Color.fromRGBO(244, 99, 212, 1.0),
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, 'menu');
      },
    );
  }

  Widget _alzaVoz() {
    return Container(
      child: Image(
        width: 130.0,
        image: AssetImage('assets/images/alzaVoz.png'),
      ),
    );
  }

  Widget _logGob() {
    return Container(
      child: Image(
        width: 150.0,
        image: AssetImage('assets/images/GobiernoPueblos.png'),
      ),
    );
  }

  Widget _optionsMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image(
                  width: 90.0,
                  image: AssetImage('assets/icons/derechos.png'),
                ),
                onPressed: () => Navigator.pushNamed(context, 'derechos'),
              ),
            ],
          ),
          Column(
            children: [
              FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image(
                  width: 90.0,
                  image: AssetImage('assets/icons/tiposV.png'),
                ),
                onPressed: () => Navigator.pushNamed(context, 'tiposViolencia'),
              ),
            ],
          ),
          Column(
            children: [
              FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image(
                  width: 90.0,
                  image: AssetImage('assets/icons/violenciometro.png'),
                ),
                onPressed: () => Navigator.pushNamed(context, 'violentometro'),
              ),
            ],
          ),
          Column(
            children: [
              FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image(
                  width: 90.0,
                  image: AssetImage('assets/icons/directorio.png'),
                ),
                onPressed: () => Navigator.pushNamed(context, 'directorio'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
