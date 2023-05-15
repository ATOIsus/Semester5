import 'package:flutter/material.dart';

import 'view/book_add.dart';
import 'view/book_view.dart';
import 'view/login_view.dart';
import 'view/register_view.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/register',

      routes: {
        '/register' : (context) => const RegisterView(), 
        '/login' : (context) => const LogInView(),       
        '/bookView' : (context) => const BookView(),          
        '/bookAdd' : (context) => const BookAddView(),  

        },
    );
  }
}