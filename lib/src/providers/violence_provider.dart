import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:violencia_cero/src/models/info_violencia_model.dart';
import 'package:violencia_cero/src/models/violence_inf_detail_model.dart';
import 'package:violencia_cero/src/models/violence_information_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class ViolenceProvider {
  final String _url = utils.generalPath;

  Future<ViolenceInformation> getListViolenceInfo() async {
    final url = '$_url/informacion';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ViolenceInformation.fromJson(jsonDecode(response.body));
      ;
    } else {
      throw Exception('Failed to load violence information');
    }
  }

  Future<InfoViolencia> getViolenceInfoDetail(String idVioleneceInf) async {
    final url = '$_url/informacion/$idVioleneceInf';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final ViolenceInfoDetail temp =
          ViolenceInfoDetail.fromJson(jsonDecode(response.body));

      final InfoViolencia info = new InfoViolencia(
        title: temp.titulo,
        description: temp.parrafos[0].texto,
        url: temp.parrafos[0].link,
      );

      return info;
    } else {
      throw Exception('Failed to load violence detail');
    }
  }
}
