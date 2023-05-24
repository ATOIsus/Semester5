
import 'view/about_us_view.dart';
import 'view/dashboard.dart';
import 'view/home.dart';
import 'view/profile.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardView(),
        '/aboutus': (context) => const AboutUsView(),
        '/home': (context) => const HomeView(),
        '/profile': (context) => const ProfileView(),
      },
    );
  }
}