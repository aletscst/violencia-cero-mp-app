import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:violencia_cero/src/models/contact_model.dart';
import 'package:violencia_cero/src/providers/contacts_provider.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactsProvider contactProvider = new ContactsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos'),
        backgroundColor: Colors.purple[300],
      ),
      body: _getContacts(),
    );
  }

  Widget _getContacts() {
    return FutureBuilder(
      future: contactProvider.getContacts(),
      builder: (BuildContext context, AsyncSnapshot<Contacts> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _fillContactList(snapshot.data),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  List<Widget> _fillContactList(Contacts contactsList) {
    List<Widget> contacts = new List<Widget>();
    contactsList.data.forEach((contact) {
      final tempContact = ListTile(
        leading: Icon(
          Icons.support_agent,
          color: Colors.purple[300],
        ),
        title: Text(contact.name),
        subtitle: Text(contact.description),
        onTap: () => {launch('tel:' + contact.number)},
      );
      contacts.add(tempContact);
      contacts.add(Divider());
    });

    return contacts;
  }
}
