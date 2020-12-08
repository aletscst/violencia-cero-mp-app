import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlert(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Cerrar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}

bool isNumeric(String value) {
  if (value.isEmpty) return false;

  final n = num.tryParse(value);

  return n == null ? false : true;
}

bool isEmail(String value) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
}
