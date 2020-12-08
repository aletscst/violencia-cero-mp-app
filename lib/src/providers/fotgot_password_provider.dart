import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:violencia_cero/src/models/forgot_password_model.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class ForgotPasswordProvider {
  final String _url = utils.generalPath;

  Future<dynamic> getCodeEmail(String email) async {
    final url = '$_url/usuario/codigo';

    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: '{"email":"$email"}');
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> checkCode(String email, String code) async {
    final url = '$_url/usuario/valida-codigo';

    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: '{"email":"$email","code":"$code"}');
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> updatePassword(UpdatePassword data) async {
    final url = '$_url/usuario/actualiza-passw/${data.id}';

    final response = await http.put(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(data));
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
