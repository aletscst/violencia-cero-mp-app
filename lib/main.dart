import 'package:flutter/material.dart';
import 'package:violencia_cero/src/pages/attention_center_list_page.dart';
import 'package:violencia_cero/src/pages/attention_center_page.dart';
import 'package:violencia_cero/src/pages/contacts_page.dart';
import 'package:violencia_cero/src/pages/home_page.dart';
import 'package:violencia_cero/src/pages/info_violence_page.dart';
import 'package:violencia_cero/src/pages/login_page.dart';
import 'package:violencia_cero/src/pages/procedure_detail_page.dart';
import 'package:violencia_cero/src/pages/procedures_page.dart';
import 'package:violencia_cero/src/pages/report_page.dart';
import 'package:violencia_cero/src/pages/violence_detail_page.dart';

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
        'login': (BuildContext context) => LoginPage(),
        'report': (BuildContext context) => ReportPage(),
        'infov': (BuildContext context) => InfoViolencePage(),
        'attentionlist': (BuildContext context) => AttentionCenterListPage(),
        'attention': (BuildContext context) => AttentionCenterPage(),
        'proceduredetail': (BuildContext context) => ProcedureDetailPage(),
        'violencedetail': (BuildContext context) => ViolenceDetailPage(),
      },
    );
  }
}
