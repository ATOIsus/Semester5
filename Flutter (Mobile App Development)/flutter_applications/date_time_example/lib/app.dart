import 'package:flutter/material.dart';

import 'view/add_user_view.dart';
import 'view/display_user_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/addUser',
      routes: {
        '/addUser': (context) => const AddUserView(),
        '/viewUser': (context) => const DisplayUserView(),
      },
    );
  }
}
