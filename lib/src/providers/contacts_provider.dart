import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:violencia_cero/src/models/contact_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class ContactsProvider {
  final String _url = utils.generalPath;

  Future<Contacts> getContacts() async {
    final url = '$_url/contactos';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Contacts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
