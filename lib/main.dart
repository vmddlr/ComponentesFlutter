import 'package:flutter/material.dart';

import 'package:component/src/pages/alert_pages.dart';
import 'package:component/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage()
      initialRoute: '/',
      routes: getApplicationRouter(),
      onGenerateRoute: (RouteSettings settings) {
        print("La ruta es ${settings.name}");

        return MaterialPageRoute(
            builder: (BuildContext context) => const AlertPages());
      },
    );
  }
}
