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
      height: sizeScreen.height * .30,
      width: sizeScreen.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment(0.0, 2.5),
          image: AssetImage('assets/images/principal3.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _elements(Size sizeScreen, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: sizeScreen.height * 0.30),
      child: Column(
        children: [
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

  Widget _derechosText() {
    return Container(
      child: Text(
        'Conoce tus derechos',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35.0,
          //fontFamily: 'Poppins',
          color: Color.fromRGBO(140, 99, 218, 1.0),
          //fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _descripcionText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'El Gobierno de los Pueblos de la alcaldía Milpa Alta tiene la' +
            ' responsabilidad de hacer valer y respetar los derechos de las mujeres' +
            ', con la finalidad de erradicar por completo todos los tipos de ' +
            'violencia hacia ellas.\n \n' +
            'Es por ello que te presentamos una serie de Leyes e instrumentos en ' +
            'donde podrás encontrar la información que salvaguarda tus derechos ' +
            'como mujer. ¡Conócelos y utilízalos!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
          //fontFamily: 'Poppins',
          color: Color.fromRGBO(140, 99, 218, 1.0),
          fontWeight: FontWeight.bold,
        ),
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
          //SizedBox(
          //  height: sizeScreen.height * 0.02,
          //),
          //_derecho4(sizeScreen),
          //SizedBox(
          //  height: sizeScreen.height * 0.02,
          //),
          //_derecho5(sizeScreen),
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
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          RaisedButton(
            elevation: 8.0,
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
                  'https://www.milpa-alta.cdmx.gob.mx/App/LeyOlimpia.pdf');
            },
          ),
          Container(
            width: sizeScreen.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Ley Olimpia',
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
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: sizeScreen.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Ley de Acceso de las Mujeres a una Vida Libre de Violencia',
              style: TextStyle(
                  color: var_utils.colors[1], fontWeight: FontWeight.bold),
            ),
          ),
          RaisedButton(
            elevation: 8.0,
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
                  'https://www.milpa-alta.cdmx.gob.mx/App/LeyDeAccesoDeLasMujeresAUnaVidaLibreDeViolencia.pdf');
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
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          RaisedButton(
            elevation: 8.0,
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
                  'https://www.milpa-alta.cdmx.gob.mx/App/LeyesEInstrumentos-IgualdaDeGenero.pdf');
            },
          ),
          Container(
            width: sizeScreen.width * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Leyes e Instrumentos Internacionales Sobre Igualdad y Perspectiva de Género',
              style: TextStyle(
                  color: var_utils.colors[1], fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  //Widget _derecho4(Size sizeScreen) {
  //  return Container(
  //    decoration: BoxDecoration(
  //      color: Colors.white,
  //      borderRadius: BorderRadius.circular(50.0),
  //    ),
  //    padding: EdgeInsets.symmetric(horizontal: 10.0),
  //    child: Row(
  //      mainAxisAlignment: MainAxisAlignment.end,
  //      children: [
  //        Container(
  //          width: sizeScreen.width * 0.6,
  //          padding: EdgeInsets.symmetric(horizontal: 10.0),
  //          child: Text(
  //            'Declaración de las Naciones Unidas para la Eliminación de la Violencia contra la Mujer (1993)',
  //            style: TextStyle(
  //                color: var_utils.colors[1], fontWeight: FontWeight.bold),
  //          ),
  //        ),
  //        RaisedButton(
  //          elevation: 8.0,
  //          color: var_utils.colors[3],
  //          shape: StadiumBorder(),
  //          child: Container(
  //            child: Icon(
  //              Icons.link,
  //              color: Colors.white,
  //            ),
  //          ),
  //          onPressed: () {
  //            _launchURL(
  //                'https://www.ohchr.org/SP/ProfessionalInterest/Pages/ViolenceAgainstWomen.aspx');
  //          },
  //        ),
  //      ],
  //    ),
  //  );
  //}
//
  //Widget _derecho5(Size sizeScreen) {
  //  return Container(
  //    decoration: BoxDecoration(
  //      color: Colors.white,
  //      borderRadius: BorderRadius.circular(50.0),
  //    ),
  //    padding: EdgeInsets.symmetric(horizontal: 10.0),
  //    child: Row(
  //      children: [
  //        RaisedButton(
  //          elevation: 5.0,
  //          color: var_utils.colors[0],
  //          shape: StadiumBorder(),
  //          child: Container(
  //            child: Icon(
  //              Icons.link,
  //              color: Colors.white,
  //            ),
  //          ),
  //          onPressed: () {
  //            _launchURL(
  //                'https://www.cndh.org.mx/sites/all/doc/programas/mujer/Material_difusion/convencion_BelemdoPara.pdf');
  //          },
  //        ),
  //        Container(
  //          width: sizeScreen.width * 0.6,
  //          padding: EdgeInsets.symmetric(horizontal: 10.0),
  //          child: Text(
  //            'Convención Interamericana para Prevenir, Atender, Sancionar y Erradicar la Violencia contra la Mujer Belem do Pará (1994)',
  //            style: TextStyle(
  //                color: var_utils.colors[1], fontWeight: FontWeight.bold),
  //          ),
  //        )
  //      ],
  //    ),
  //  );
  //}

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
