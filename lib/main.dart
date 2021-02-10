import 'package:flutter/material.dart';
import 'package:violencia_cero/src/pages/attention_center_page.dart';
import 'package:violencia_cero/src/pages/denuncia/denunciado_page.dart';
import 'package:violencia_cero/src/pages/denuncia/solicitante_page.dart';
import 'package:violencia_cero/src/pages/forgot_password/check_code_page.dart';
import 'package:violencia_cero/src/pages/forgot_password/send_code_page.dart';
import 'package:violencia_cero/src/pages/forgot_password/update_password.dart';
import 'package:violencia_cero/src/pages/login_page.dart';
import 'package:violencia_cero/src/pages/new_desing/conoce_derechos_page.dart';
import 'package:violencia_cero/src/pages/new_desing/directorio_page.dart';
import 'package:violencia_cero/src/pages/new_desing/info_violencia_page.dart';
import 'package:violencia_cero/src/pages/new_desing/inicio_page.dart';
import 'package:violencia_cero/src/pages/new_desing/menu_page.dart';
import 'package:violencia_cero/src/pages/new_desing/tipos_violencia_page.dart';
import 'package:violencia_cero/src/pages/new_desing/violentometro3_page.dart';
import 'package:violencia_cero/src/pages/new_desing/violentometro2_page.dart';
import 'package:violencia_cero/src/pages/new_desing/violentometro_page.dart';
import 'package:violencia_cero/src/pages/register_page.dart';
import 'package:violencia_cero/src/pages/denuncia/report_page.dart';
import 'package:violencia_cero/src/pages/success_page.dart';
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
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      initialRoute: 'inicio',
      routes: <String, WidgetBuilder>{
        'inicio': (BuildContext context) => InicioPage(),
        'menu': (BuildContext context) => MenuPage(),
        'violentometro': (BuildContext context) => ViolentometroPage(),
        'violentometro2': (BuildContext context) => Violentometro2Page(),
        'violentometro3': (BuildContext context) => Violentometro3Page(),
        'tiposViolencia': (BuildContext context) => TiposViolenciaPage(),
        'directorio': (BuildContext context) => DirectorioPage(),
        'derechos': (BuildContext context) => ConoceDerechosPage(),
        'infoviolencia': (BuildContext context) => InfoViolenciaPage(),
        //'home': (BuildContext context) => HomePage(),
        //'contacts': (BuildContext context) => ContactsPage(),
        //'procedures': (BuildContext context) => ProceduresPage(),
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'solicitante': (BuildContext context) => SolicitantePage(),
        'denunciado': (BuildContext context) => DenunciadoPage(),
        'report': (BuildContext context) => ReportPage(),
        //'infov': (BuildContext context) => InfoViolencePage(),
        //'attentionlist': (BuildContext context) => AttentionCenterListPage(),
        'attention': (BuildContext context) => AttentionCenterPage(),
        //'proceduredetail': (BuildContext context) => ProcedureDetailPage(),
        //'violencedetail': (BuildContext context) => ViolenceDetailPage(),
        'success': (BuildContext context) => SuccessPage(),
        'sendcode': (BuildContext context) => SendCodePage(),
        'checkcode': (BuildContext context) => CheckCodePage(),
        'updatepassword': (BuildContext context) => UpdatePasswordPage()
      },
    );
  }
}
