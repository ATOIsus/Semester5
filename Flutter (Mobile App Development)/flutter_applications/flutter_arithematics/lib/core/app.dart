import 'package:flutter/material.dart';

import '../config/router/app_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      initialRoute: AppRoute.homeRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
