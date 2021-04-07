import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final String generalPath = 'http://201.116.12.210:3000';
//final String generalPath = 'http://192.168.0.18:3000';

final List<int> ages = _getAges();

final List<Color> colors = [
  Color.fromRGBO(187, 98, 218, 1.0),
  Color.fromRGBO(140, 99, 218, 1.0),
  Color.fromRGBO(97, 71, 197, 1.0),
  Color.fromRGBO(244, 99, 212, 1.0),
];

final List<String> scolarships = [
  'Ninguna',
  'Primaria',
  'Secundaria',
  'Media Superior',
  'Superior',
  'Otro',
];

final List<String> maritaStatus = [
  'Soltera(o)',
  'Casada(o)',
  'Divorciada(o)',
  'Vuida(o)',
  'Otro',
];

final List<String> relationship = [
  'Padre',
  'Madre',
  'Hermano(a)',
  'Abuelo(a)',
  'Tio(a)',
  'Primo(a)',
  'Otro',
];

final List<String> states = [
  'Aguascalientes',
  'Baja California',
  'Baja California Sur',
  'Campeche',
  'CDMX',
  'Chiapas',
  'Chihuahua',
  'Ciudad de México',
  'Coahuila',
  'Colima',
  'Durango',
  'Estado de México',
  'Guanajuato',
  'Guerrero',
  'Hidalgo',
  'Jalisco',
  'Michoacán',
  'Morelos',
  'Nayarit',
  'Nuevo León',
  'Oaxaca',
  'Puebla',
  'Querétaro',
  'Quintana Roo',
  'San Luis Potosí',
  'Sinaloa',
  'Sonora',
  'Tabasco',
  'Tamaulipas',
  'Tlaxcala',
  'Veracruz',
  'Yucatán',
  'Zacatecas',
];

List<int> _getAges() {
  List<int> ages = new List<int>();

  for (var i = 1; i < 100; i++) {
    ages.add(i);
  }

  return ages;
}

final BottomAppBar phoneBar = BottomAppBar(
  shape: const CircularNotchedRectangle(),
  child: Container(
    height: 50.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Image(
            image: AssetImage('assets/icons/tel.png'),
          ),
          onPressed: () => launch('tel:5543236808'),
        ),
        IconButton(
          icon: Image(
            image: AssetImage('assets/icons/whats.png'),
          ),
          onPressed: () async {
            if (Platform.isIOS) {
              final whatsappUrl = 'whatsapp://wa.me/5543236808';
              await canLaunch(whatsappUrl)
                  ? launch(whatsappUrl)
                  : print(
                      "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
            } else {
              final whatsappUrl =
                  'whatsapp://send?text=Hola&phone=+525543236808&abid=+525543236808';
              await canLaunch(whatsappUrl)
                  ? launch(whatsappUrl)
                  : print(
                      "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
            }
          },
        ),
      ],
    ),
  ),
);
