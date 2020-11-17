import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'phone': Icons.phone,
  'book': Icons.book,
  'denuncia': Icons.account_balance,
  'info_violen': Icons.assignment,
  'centros_aten': Icons.person_pin_circle,
};

Icon getIconByName(String iconName) {
  return Icon(
    _icons[iconName],
    size: 35.0,
    color: Colors.purple[400],
  );
}
