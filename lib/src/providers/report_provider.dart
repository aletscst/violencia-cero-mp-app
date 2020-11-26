import 'dart:convert';
import 'dart:io';

import 'package:violencia_cero/src/models/generic_response.dart';
import 'package:violencia_cero/src/models/report_model.dart';

import 'package:http/http.dart' as http;
import 'package:violencia_cero/src/share_prefs/user_preferences.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class ReportProvider {
  final String _url = utils.generalPath;
  final _prefs = new UserPreferences();

  Future<GenericResponse> postReport(Report report) async {
    final url = '$_url/denuncias';

    final response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          'Authorization': 'Bearer ${_prefs.token}'
        },
        body: jsonEncode(report));

    if (response.statusCode == 200) {
      return GenericResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
