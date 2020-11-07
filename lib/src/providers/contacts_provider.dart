import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:violencia_cero/src/models/contact_model.dart';
import 'package:violencia_cero/src/utils/variables_utils.dart' as utils;

class ContactsProvider {
  final String _url = utils.generalPath;

  Future<List<Contact>> getContacts() async {
    final url = '$_url/contacts';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final contactsJson = jsonDecode(response.body);
      final contactsResp = List.from(contactsJson);
      final List<Contact> contacts = new List<Contact>();

      contactsResp.forEach((element) {
        final Contact contact = Contact.fromJson(element);
        contacts.add(contact);
      });
      print('provider' + contacts[0].name);
      return contacts;
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
