import 'package:flutter/material.dart';
import 'package:simple_interest/view/stack_view.dart';

import 'view/another_view.dart';
import 'view/arithmetic_view.dart';
import 'view/card_view.dart';
import 'view/circle_view.dart';
import 'view/column_view.dart';
import 'view/dashboard_view.dart';
import 'view/details_view.dart';
import 'view/display_name_view.dart';
import 'view/flexible_view.dart';
import 'view/grid_view_screen.dart';
import 'view/loadimage_view.dart';
import 'view/media_query_view.dart';
import 'view/output_view.dart';
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

        '/outputRoute' : (context) => const OutputView(),
        '/containerRoute' : (context) => const AnotherView(),

         '/imageRoute' : (context) => const LoadImageView(),
          '/mediaRoute' : (context) => const MediaQueryView(),

          '/flexibleRoute' : (context) => const FlexibleView(),

          '/studentRoute' : (context) => const DetailsView(),
          
          '/cardRoute' : (context) => const CardView(),
          '/gridRoute' : (context) => const GridViewScreen(),

                    '/stackRoute' : (context) => const StackView(),
        },
    );
  }
}