import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:violencia_cero/src/models/generic_response.dart';
import 'package:violencia_cero/src/models/login_model.dart';
import 'package:violencia_cero/src/models/register_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class AuthProvider {
  final String _url = utils.generalPath;

  Future<dynamic> login(Login login) async {
    final url = '$_url/usuario/login';

    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(login));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  Future<GenericResponse> register(Register register) async {
    final url = '$_url/usuario/registro';

    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(register));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GenericResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
