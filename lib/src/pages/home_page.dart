import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/option_menu_model.dart';
import 'package:violencia_cero/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  final List<OptionMenu> _menuOptions = [
    new OptionMenu(
        name: 'Contactos de Emergencia', route: 'contacts', icon: 'phone'),
    new OptionMenu(name: 'Procedimientos', route: 'procedures', icon: 'book'),
    new OptionMenu(name: 'Denuncia', route: 'login', icon: 'denuncia'),
    new OptionMenu(
        name: 'Informacion sobre violencia',
        route: 'infov',
        icon: 'info_violen'),
    new OptionMenu(
        name: 'Centros de atencion',
        route: 'attentionlist',
        icon: 'centros_aten'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Violencia Cero'),
        backgroundColor: Colors.purple[300],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            children: _getMenu(context),
          ),
        ],
      ),
    );
  }

  List<Widget> _getMenu(BuildContext context) {
    List<Widget> menu = new List<Widget>();
    menu.add(SizedBox(height: 10.0));
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
        elevation: 9.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      );
      menu.add(optionCard);
      menu.add(SizedBox(height: 10.0));
    });

    return menu;
  }
}
