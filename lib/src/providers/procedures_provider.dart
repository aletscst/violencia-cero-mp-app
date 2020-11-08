import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:violencia_cero/src/models/procedure_detail_model.dart';
import 'package:violencia_cero/src/models/procedure_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class ProcedureProvider {
  final String _url = utils.generalPath;

  Future<List<Procedure>> getListProcedures() async {
    final url = '$_url/procedures';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final contactsJson = jsonDecode(response.body);
      final contactsResp = List.from(contactsJson);
      final List<Procedure> contacts = new List<Procedure>();

      contactsResp.forEach((element) {
        final Procedure contact = Procedure.fromJson(element);
        contacts.add(contact);
      });

      return contacts;
    } else {
      throw Exception('Failed to load contacts');
    }
  }

  Future<ProcedureDetail> getProcedureDetail(String idProcedure) async {
    final url = '$_url/procedures/$idProcedure';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ProcedureDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
