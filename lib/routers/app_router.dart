import 'package:flutter/material.dart';
import 'package:univalle_estereo/screens/screens.dart';

class AppRouter {
  AppRouter._();
  static const String initialRouter = '/';
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    initialRouter: (context) => const MainScreen(),
    'home': (context) => const HomeScreen(),
    'detalles': (context) => const DetallePostScreen(),
    'offline': (context) => const OffLineScreen()
  };
}
