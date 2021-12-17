import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'whatshot': Icons.whatshot,
};

Icon getIcon(String nombreIcon){
  return Icon(_icons[nombreIcon], color: Colors.blue,);
}