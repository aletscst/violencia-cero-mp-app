import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:violencia_cero/src/models/procedure_detail_model.dart';
import 'package:violencia_cero/src/models/procedure_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class ProcedureProvider {
  final String _url = utils.generalPath + '/procedimientos';

  Future<Procedure> getListProcedures() async {
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      return Procedure.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load contacts');
    }
  }

  Future<ProcedureDetail> getProcedureDetail(String idProcedure) async {
    final url = '$_url/$idProcedure';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ProcedureDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
