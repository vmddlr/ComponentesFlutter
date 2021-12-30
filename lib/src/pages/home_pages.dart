import 'package:component/src/providers/menu_provider.dart';
import 'package:component/src/utils/icon_string_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo de componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // print(menuProvider.option);
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: const [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItem(snapshot.data!, context),
          );
        });
  }

  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
    final List<Widget> list = [];

    for (var item in data) {
      final wtemp = ListTile(
          title: Text(item['texto']),
          leading: getIcon(item['icon']),
          trailing:
              const Icon(Icons.keyboard_arrow_right, color: Colors.orange),
          onTap: () {
            Navigator.pushNamed(context, item['ruta']);

            // var route = MaterialPageRoute(builder: (context) {
            //   return const AlertPages();
            // });
            //
            // Navigator.push(context, route);
          });

      list
        ..add(wtemp)
        ..add(const Divider(
          thickness: 1.0,
          color: Colors.brown,
        ));
    }

    return list;
  }
}
