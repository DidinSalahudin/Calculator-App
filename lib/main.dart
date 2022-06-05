import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'core/route_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xff49a2f1),
        backgroundColor: const Color(0xffc8dfec),
        canvasColor: const Color(0xfff6686c),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Color(0xff0b4465), fontWeight: FontWeight.bold),
          displayMedium: TextStyle(color: Color(0xff0b4465)),
          displayLarge: TextStyle(color: Color(0xff0b4465)),
        ),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff49a2f1),
        backgroundColor: const Color(0xff121212),
        canvasColor: const Color(0xfff6686c),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white70),
          displayMedium: TextStyle(color: Colors.white54),
          displayLarge: TextStyle(color: Colors.white70),
        ),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator',
        theme: theme,
        darkTheme: darkTheme,
        onGenerateRoute: RouteApp.route,
        initialRoute: RouteApp.routeSplash,
      ),
    );
  }
}
