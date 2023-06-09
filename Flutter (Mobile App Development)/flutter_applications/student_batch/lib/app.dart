

import 'package:flutter/material.dart';
import 'view/dashbaord_view.dart';
import 'view/student_details_view.dart';
import 'view/signup_view.dart';
import 'view/signin_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      initialRoute: '/signupRoute',

      routes: {
        '/signupRoute' : (context) => const SignUpView(),                  // context (source) => destination
        '/signinRoute' : (context) => const SignInView(),
        '/dashboardRoute' : (context) => const DashbaordView(),
        '/studentDetailRoute' : (context) => const StudentDetailView(),


        },
    );
  }
}