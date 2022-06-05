import 'dart:async';

import 'package:flutter/material.dart';

import '../core/route_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        RouteApp.routeCalculator,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/splash_screen.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            Text(
              'Calculator',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 24.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
