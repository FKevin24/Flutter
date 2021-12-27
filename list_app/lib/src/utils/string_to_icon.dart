import 'package:flutter/material.dart';

final icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'access_alarm': Icons.access_alarm,
  'air': Icons.air,
  'person_off': Icons.person_off,
  'sports_mma': Icons.sports_mma,
};

Icon getIcon(String nombre) {
  return Icon(icons[nombre]);
}
