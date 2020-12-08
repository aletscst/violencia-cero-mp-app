import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class ConoceDerechosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _fondo(sizeScreen),
            _elements(sizeScreen, context),
          ],
        ),
      ),
      bottomNavigationBar: var_utils.phoneBar,
    );
  }

  Widget _fondo(Size sizeScreen) {
    return Container(
      height: sizeScreen.height * .35,
      width: sizeScreen.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment(0.0, 2.5),
          image: AssetImage('assets/images/fondoSup.png'),
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
          SizedBox(
            height: sizeScreen.height * 0.04,
          ),
          _imgVcero(),
          SizedBox(
            height: sizeScreen.height * 0.04,
          ),
          _derechosText(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(
              color: var_utils.colors[1],
            ),
          ),
          _descripcionText(),
          SizedBox(
            height: sizeScreen.height * 0.04,
          ),
          _derechosList(sizeScreen),
        ],
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

  Widget _derechosText() {
    return Container(
      child: Text(
        'Conoce tus derechos',
        style: TextStyle(
            fontSize: 35.0,
            color: Color.fromRGBO(140, 99, 218, 1.0),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _descripcionText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'La Alcaldía de Milpa Alta tiene la responsabilidad de garantizar los derechos de las mujeres y las niñas y son derechos humanos.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 15.0,
            color: Color.fromRGBO(140, 99, 218, 1.0),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _derechosList(Size sizeScreen) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          _derecho1(sizeScreen),
          SizedBox(
            height: sizeScreen.height * 0.02,
          ),
          _derecho2(sizeScreen),
          SizedBox(
            height: sizeScreen.height * 0.02,
          ),
          _derecho3(sizeScreen),
          SizedBox(
            height: sizeScreen.height * 0.02,
          ),
          _derecho4(sizeScreen),
          SizedBox(
            height: sizeScreen.height * 0.02,
          ),
          _derecho5(sizeScreen),
          SizedBox(
            height: sizeScreen.height * 0.02,
          ),
        ],
      ),
    );
  }

  Widget _derecho1(Size sizeScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          FlatButton(
            color: var_utils.colors[2],
            shape: StadiumBorder(),
            child: Container(
              child: Icon(
                Icons.link,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _launchURL(
                  'http://historico.juridicas.unam.mx/publica/librev/rev/derhum/cont/25/pr/pr22.pdf');
            },
          ),
          Container(
            width: sizeScreen.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Convención sobre los Derechos Políticos de la Mujer (1952)',
              style: TextStyle(
                  color: var_utils.colors[1], fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _derecho2(Size sizeScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: sizeScreen.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Discriminación contra la Mujer CEDAW(1967)',
              style: TextStyle(
                  color: var_utils.colors[1], fontWeight: FontWeight.bold),
            ),
          ),
          FlatButton(
            color: var_utils.colors[0],
            shape: StadiumBorder(),
            child: Container(
              child: Icon(
                Icons.link,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _launchURL(
                  'https://www.ohchr.org/sp/professionalinterest/pages/cedaw.aspx');
            },
          ),
        ],
      ),
    );
  }

  Widget _derecho3(Size sizeScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          FlatButton(
            color: var_utils.colors[1],
            shape: StadiumBorder(),
            child: Container(
              child: Icon(
                Icons.link,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _launchURL(
                  'https://www.unwomen.org/es/how-we-work/intergovernmental-support/world-conferences-on-women');
            },
          ),
          Container(
            width: sizeScreen.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Conferencias mundiales sobre la mujer',
              style: TextStyle(
                  color: var_utils.colors[1], fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _derecho4(Size sizeScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: sizeScreen.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Declaración de las Naciones Unidas para la Eliminación de la Violencia contra la Mujer (1993)',
              style: TextStyle(
                  color: var_utils.colors[1], fontWeight: FontWeight.bold),
            ),
          ),
          FlatButton(
            color: var_utils.colors[3],
            shape: StadiumBorder(),
            child: Container(
              child: Icon(
                Icons.link,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _launchURL(
                  'https://www.ohchr.org/SP/ProfessionalInterest/Pages/ViolenceAgainstWomen.aspx');
            },
          ),
        ],
      ),
    );
  }

  Widget _derecho5(Size sizeScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          FlatButton(
            color: var_utils.colors[0],
            shape: StadiumBorder(),
            child: Container(
              child: Icon(
                Icons.link,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _launchURL(
                  'https://www.cndh.org.mx/sites/all/doc/programas/mujer/Material_difusion/convencion_BelemdoPara.pdf');
            },
          ),
          Container(
            width: sizeScreen.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Convención Interamericana para Prevenir, Atender, Sancionar y Erradicar la Violencia contra la Mujer Belem do Pará (1994)',
              style: TextStyle(
                  color: var_utils.colors[1], fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}