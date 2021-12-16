import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

  List<dynamic> option = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    var rep = await rootBundle.loadString('data/menu_opts.json');
    Map result = json.decode(rep);
    option = result['rutas'];

    return option;
  }
}

final menuProvider = _MenuProvider();