import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:violencia_cero/src/models/attention_center_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class AttentionCenterProvider {
  final String _url = utils.generalPath + '/centros';

  Future<AttentionCenter> getAttentionCenters() async {
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      return AttentionCenter.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
