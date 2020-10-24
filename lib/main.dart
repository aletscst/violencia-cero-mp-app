import 'package:flutter/material.dart';
import 'package:violencia_cero/src/pages/contacts_page.dart';
import 'package:violencia_cero/src/pages/home_page.dart';
import 'package:violencia_cero/src/pages/procedures_page.dart';
import 'package:violencia_cero/src/pages/report_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => HomePage(),
        'contacts': (BuildContext context) => ContactsPage(),
        'procedures': (BuildContext context) => ProceduresPage(),
        'report': (BuildContext context) => ReportPage(),
      },
    );
  }
}
