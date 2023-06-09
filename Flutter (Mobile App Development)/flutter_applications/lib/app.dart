import 'package:flutter/material.dart';

import 'view/arithmetic_view.dart';
import 'view/circle_view.dart';
import 'view/column_view.dart';
import 'view/dashboard_view.dart';
import 'view/display_name_view.dart';
import 'view/rich_text_view.dart';
import 'view/simple_view.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {
        '/' : (context) => const DashboardView(),                  // context (source) => destination
        '/arithmeticRoute' : (context) => const ArithmeticView(),
        '/siRoute' : (context) => const SimpleInterestView(),
        '/circleRoute' : (context) => const CircleView(),
        '/displayRoute' : (context) => const DisplayNameView(),
        '/richTextRoute' : (context) => const RichTextView(),
        '/columnRoute' : (context) => const ColumnView(),

        },
    );
  }
}