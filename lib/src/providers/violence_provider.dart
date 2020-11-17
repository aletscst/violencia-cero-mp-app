import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:violencia_cero/src/models/violence_inf_detail_model.dart';
import 'package:violencia_cero/src/models/violence_information_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class ViolenceProvider {
  final String _url = utils.generalPath;

  Future<List<ViolenceInformation>> getListViolenceInfo() async {
    final url = '$_url/violence';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final violenceJson = jsonDecode(response.body);
      final violenceResp = List.from(violenceJson);
      final List<ViolenceInformation> vioInfo = new List<ViolenceInformation>();

      violenceResp.forEach((element) {
        final ViolenceInformation contact =
            ViolenceInformation.fromJson(element);
        vioInfo.add(contact);
      });

      return vioInfo;
    } else {
      throw Exception('Failed to load contacts');
    }
  }

  Future<ViolenceInfoDetail> getViolenceInfoDetail(
      String idVioleneceInf) async {
    final url = '$_url/violence/$idVioleneceInf';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ViolenceInfoDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
