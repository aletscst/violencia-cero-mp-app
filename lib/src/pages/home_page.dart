import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/option_menu_model.dart';
import 'package:violencia_cero/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  final List<OptionMenu> _menuOptions = [
    new OptionMenu(name: 'Contactos', route: 'contacts', icon: 'phone'),
    new OptionMenu(name: 'Procedimientos', route: 'procedures', icon: 'book'),
    new OptionMenu(name: 'Denuncia', route: 'report', icon: 'book')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Violencia Cero'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: _getMenu(context),
      ),
    );
  }

  List<Widget> _getMenu(BuildContext context) {
    List<Widget> menu = new List<Widget>();

    _menuOptions.forEach((option) {
      final optionCard = Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: getIconByName(option.icon),
              title: Text(option.name),
              onTap: () {
                Navigator.pushNamed(context, option.route);
              },
            ),
          ],
        ),
        elevation: 6.0,
      );
      menu.add(optionCard);
    });

    return menu;
  }
}
