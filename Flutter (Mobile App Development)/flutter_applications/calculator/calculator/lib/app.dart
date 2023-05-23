import 'package:calculator/view/screen_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {
        '/' : (context) => const ScreenView(),                  // context (source) => destination
        
        },
    );
  }     
}