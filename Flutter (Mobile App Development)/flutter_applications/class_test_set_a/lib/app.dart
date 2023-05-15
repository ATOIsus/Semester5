import './view/pay_due_view.dart';

import './view/dashboard.dart';
import './view/login_screen.dart';
import './view/signup_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/signup',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/payDue': (context) => const PayDueView(),
          '/signup': (context) => const SignUpScreen(),
          '/dashboard': (context) => const DashboardScreen()
        });
  }
}
