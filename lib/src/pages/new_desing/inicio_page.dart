import 'package:flutter/material.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _fondo(sizeScreen),
          _fondoDecoration(sizeScreen),
          _elements(sizeScreen, context),
        ],
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
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: sizeScreen.height * 0.06),
        child: Column(
          children: [
            _logoVcero(sizeScreen),
            SizedBox(
              height: sizeScreen.height * 0.03,
            ),
            _imgVcero(sizeScreen),
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
            _alzaVoz(sizeScreen),
            SizedBox(
              height: sizeScreen.height * 0.04,
            ),
            _logGob(sizeScreen),
            SizedBox(
              height: sizeScreen.height * 0.04,
            ),
            _optionsMenu(context, sizeScreen),
          ],
        ),
      ),
    );
  }

  Widget _logoVcero(Size sizeScreen) {
    return Container(
      child: Image(
        width: sizeScreen.width * 0.35,
        image: AssetImage('assets/images/vcero.png'),
      ),
    );
  }

  Widget _imgVcero(Size sizeScreen) {
    return Container(
      child: Material(
        elevation: 12.0,
        shape: CircleBorder(),
        child: Image(
          width: sizeScreen.width * 0.25,
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
          'DENUNCIA',
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
        Navigator.pushNamed(context, 'login');
      },
    );
  }

  Widget _alzaVoz(Size sizeScreen) {
    return Container(
      child: Image(
        width: sizeScreen.width * 0.3,
        image: AssetImage('assets/images/alzaVoz.png'),
      ),
    );
  }

  Widget _logGob(Size sizeScreen) {
    return Container(
      child: Image(
        width: sizeScreen.width * 0.3,
        image: AssetImage('assets/images/GobiernoPueblos.png'),
      ),
    );
  }

  Widget _optionsMenu(BuildContext context, Size sizeScreen) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Card(
              elevation: 0.0,
              color: Colors.transparent,
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image(
                  image: AssetImage('assets/icons/derechos.png'),
                ),
                onPressed: () => Navigator.pushNamed(context, 'derechos'),
              ),
            ),
          ),
          Flexible(
            child: Card(
              elevation: 0.0,
              color: Colors.transparent,
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image(
                  image: AssetImage('assets/icons/tiposV.png'),
                ),
                onPressed: () => Navigator.pushNamed(context, 'tiposViolencia'),
              ),
            ),
          ),
          Flexible(
            child: Card(
              elevation: 0.0,
              color: Colors.transparent,
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image(
                  image: AssetImage('assets/icons/violenciometro.png'),
                ),
                onPressed: () => Navigator.pushNamed(context, 'violentometro'),
              ),
            ),
          ),
          Flexible(
            child: Card(
              elevation: 0.0,
              color: Colors.transparent,
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                child: Image(
                  image: AssetImage('assets/icons/directorio.png'),
                ),
                onPressed: () => Navigator.pushNamed(context, 'directorio'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
