import 'package:flutter/material.dart';

import '../feature/calculator_screen.dart';
import '../feature/splash_screen.dart';

class RouteApp {
  static const String routeSplash = '/';
  static const String routeCalculator = 'calculator';

  static Route<dynamic>? route(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case routeCalculator:
        return MaterialPageRoute(
          builder: (_) => const Calculator(),
        );
      default:
    }
    return null;
  }
}
