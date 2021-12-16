import 'package:component/src/pages/cards_pages.dart';
import 'package:flutter/material.dart';

import 'package:component/src/pages/alert_pages.dart';
import 'package:component/src/pages/avatar_pages.dart';
import 'package:component/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRouter() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPages(),
    'avatar': (BuildContext context) => const AvatarPages(),
    'card': (BuildContext context) => const CardsPage(),
  };
}