

import 'package:flutter/material.dart';
import 'package:hackathon/screens/auth/auth_page.dart';
import 'package:hackathon/screens/design_router_screen.dart';
import 'package:hackathon/screens/history_page/history_page.dart';
import 'package:hackathon/screens/main_screen/main_screen.dart';
import 'package:hackathon/screens/oku_page/oku_page.dart';
import 'package:hackathon/screens/yazPage/yaz_page.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/design_route": (context) => DesignRouterScreen(),
    "/authPage": (context) => AuthPage(),
    "/mainScreen": (context) => MainScreen(),
    "/yaz": (context) => Yaz(),
    '/oku': (context) => OkuPage(),
    '/history': (context) => HistoryPage(),


  };
  static Map<String, WidgetBuilder> getAll() => _routes;
}
