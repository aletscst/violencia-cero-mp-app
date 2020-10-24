import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'phone': Icons.phone,
  'book': Icons.book,
};

Icon getIconByName(String iconName) {
  return Icon(_icons[iconName]);
}
