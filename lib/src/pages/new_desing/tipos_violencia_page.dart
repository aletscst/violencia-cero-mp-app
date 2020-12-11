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
              image: AssetImage('assets/images/pensiona.png'),
            ),
            onPressed: () {
              final InfoViolencia info = new InfoViolencia(
                  title: 'Pensión alimenticia',
                  description:
                      'Puede definirse como el deber impuesto a una o varias personas de asegurar la subsistencia de una u otra, comprenden todo lo indispensable para el sustento, habitación, vestido, asistencia médica y educación.',
                  url:
                      'https://www.poderjudicialcdmx.gob.mx/recepcion-de-demandas-iniciales-en-materia-familiar/');
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violenciaFam.png'),
            ),
            onPressed: () {
              final InfoViolencia info = new InfoViolencia(
                  title: 'Violencia Familiar',
                  description:
                      'Ocurre dentro y fuera del domicilio de la víctima por parte de la persona agresora con la que tenga o haya tenido parentesco por consanguinidad y afinidad, derivada del concubinato, matrimonio, o sociedad en convivencia, es decir: la pareja varón y los parientes de la esposa y entre la mujer y los parientes del esposo.',
                  url:
                      'https://www.poderjudicialcdmx.gob.mx/recepcion-de-demandas-iniciales-en-materia-familiar/');
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/maltratoInfantil.png'),
            ),
            onPressed: () {
              final InfoViolencia info = new InfoViolencia(
                  title: 'Maltrato infantil',
                  description:
                      'Se define como los abusos y la desatención de que son objeto los menores de 18 años, e incluye todos los tipos de maltrato físico o psicológico, abuso sexual, desatención, negligencia y explotación comercial o de otro tipo que causen o puedan causar un daño a la salud, desarrollo o dignidad del niño, o poner en peligro su supervivencia.',
                  url: 'https://www.fgjcdmx.gob.mx/');
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
              image: AssetImage('assets/images/maltratoMayores.png'),
            ),
            onPressed: () {
              final InfoViolencia info = new InfoViolencia(
                  title: 'Maltrato a adultos mayores',
                  description:
                      'Es un acto único o repetido que causa daño o sufrimiento a una persona de edad, o la falta de medidas apropiadas para evitarlo, que se produce en una relación basada en la confianza.',
                  url: 'https://www.fgjcdmx.gob.mx/');
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(0.0),
            child: Image(
              width: sizeScreen.width * 0.4,
              image: AssetImage('assets/images/violenciaDig.png'),
            ),
            onPressed: () {
              final InfoViolencia info = new InfoViolencia(
                  title: 'Violencia digital',
                  description:
                      'El acoso cibernético (o ciberacoso) consiste en utilizar la tecnología para amenazar, avergonzar, intimidar o criticar a otra persona. En otras palabras, es todo aquello que se publica en Internet con la intención de hacer daño, avergonzar o molestar a otra persona.',
                  url: 'http://data.ssp.cdmx.gob.mx/ciberdelincuencia.html');
              Navigator.pushNamed(context, 'infoviolencia', arguments: info);
            },
          )
        ],
      ),
    );
  }
}
