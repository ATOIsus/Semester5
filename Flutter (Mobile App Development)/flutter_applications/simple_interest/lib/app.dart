import 'package:flutter/material.dart';
import 'package:simple_interest/view/arithmetic_view.dart';
import 'view/simple_view.dart';
import 'view/arithmetic_view.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(


      debugShowCheckedModeBanner: false,


        home: ArithmeticView(),
              //SimpleInterestView(), 

        );
  }
}