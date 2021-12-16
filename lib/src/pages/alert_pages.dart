import 'package:flutter/material.dart';

class AlertPages extends StatelessWidget {
  const AlertPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Alert Pages'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Mostrar Alerta',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onPressed: () => _mostrarAlert(context),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue, shape: const StadiumBorder()),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_location),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Este es un texto de la columna',
                  style: TextStyle(fontSize: 17),
                ),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 15),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          );
        });
  }
}
