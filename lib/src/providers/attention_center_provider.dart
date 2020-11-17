import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:violencia_cero/src/models/attention_center_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class AttentionCenterProvider {
  final String _url = utils.generalPath;

  Future<List<AttentionCenter>> getAttentionCenters() async {
    final url = '$_url/attention-center';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final attentionCentJson = jsonDecode(response.body);
      final attentionCentResp = List.from(attentionCentJson);
      final List<AttentionCenter> attentionCent = new List<AttentionCenter>();

      attentionCentResp.forEach((element) {
        final AttentionCenter attentionCenter =
            AttentionCenter.fromJson(element);
        attentionCent.add(attentionCenter);
      });

      return attentionCent;
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
