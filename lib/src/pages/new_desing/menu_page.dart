import 'package:flutter/material.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class MenuPage extends StatelessWidget {
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
          _fondoDecoration(sizeScreen),
          _elements(sizeScreen),
          _menuList(sizeScreen, context),
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
            Color.fromRGBO(140, 99, 218, 1.0),
            Color.fromRGBO(181, 96, 179, 1.0),
          ],
        ),
      ),
    );
  }

  Widget _fondoDecoration(Size sizeScreen) {
    return Container(
      height: sizeScreen.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.1),
            BlendMode.dstATop,
          ),
        ),
      ),
    );
  }

  Widget _elements(Size sizeScreen) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: sizeScreen.height * 0.06),
      child: Column(
        children: [
          _logo(),
          SizedBox(
            height: sizeScreen.height * 0.03,
          ),
          _menuText(),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Image(
        width: 150.0,
        image: AssetImage('assets/images/logo_blanco.png'),
      ),
    );
  }

  Widget _menuText() {
    return Container(
      child: Text(
        'Menú',
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _menuList(Size sizeScreen, BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 20.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    final divider = Divider(color: Colors.white);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: sizeScreen.height * 0.31,
        left: sizeScreen.width * 0.15,
        right: sizeScreen.width * 0.15,
      ),
      child: ListView(
        children: [
          ListTile(
            title: Text(
              '01 - Conoce tus derechos',
              style: textStyle,
            ),
            onTap: () => Navigator.pushNamed(context, 'derechos'),
          ),
          divider,
          ListTile(
            title: Text(
              '02 - Tipos de violencia',
              style: textStyle,
            ),
            onTap: () => Navigator.pushNamed(context, 'tiposViolencia'),
          ),
          divider,
          ListTile(
            title: Text(
              '03 - Violentómetro',
              style: textStyle,
            ),
            onTap: () => Navigator.pushNamed(context, 'violentometro'),
          ),
          divider,
          ListTile(
            title: Text(
              '04 - Directorio',
              style: textStyle,
            ),
            onTap: () => Navigator.pushNamed(context, 'directorio'),
          ),
          divider,
          ListTile(
            title: Text(
              '05 - Denuncia',
              style: textStyle,
            ),
            onTap: () => Navigator.pushNamed(context, 'login'),
          ),
        ],
      ),
    );
  }
}
