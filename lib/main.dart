import 'package:flutter/material.dart';
import 'package:violencia_cero/src/pages/attention_center_list_page.dart';
import 'package:violencia_cero/src/pages/attention_center_page.dart';
import 'package:violencia_cero/src/pages/contacts_page.dart';
import 'package:violencia_cero/src/pages/denuncia/denunciado_page.dart';
import 'package:violencia_cero/src/pages/denuncia/solicitante_page.dart';
import 'package:violencia_cero/src/pages/home_page.dart';
import 'package:violencia_cero/src/pages/info_violence_page.dart';
import 'package:violencia_cero/src/pages/login_page.dart';
import 'package:violencia_cero/src/pages/procedure_detail_page.dart';
import 'package:violencia_cero/src/pages/procedures_page.dart';
import 'package:violencia_cero/src/pages/register_page.dart';
import 'package:violencia_cero/src/pages/denuncia/report_page.dart';
import 'package:violencia_cero/src/pages/success_page.dart';
import 'package:violencia_cero/src/pages/violence_detail_page.dart';
import 'package:violencia_cero/src/share_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

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
        'register': (BuildContext context) => RegisterPage(),
        'solicitante': (BuildContext context) => SolicitantePage(),
        'denunciado': (BuildContext context) => DenunciadoPage(),
        'report': (BuildContext context) => ReportPage(),
        'infov': (BuildContext context) => InfoViolencePage(),
        'attentionlist': (BuildContext context) => AttentionCenterListPage(),
        'attention': (BuildContext context) => AttentionCenterPage(),
        'proceduredetail': (BuildContext context) => ProcedureDetailPage(),
        'violencedetail': (BuildContext context) => ViolenceDetailPage(),
        'success': (BuildContext context) => SuccessPage(),
      },
    );
  }
}
