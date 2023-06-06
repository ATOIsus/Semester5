import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/add_student_view.dart';
import 'view/add_view.dart';
import 'view/counter_view.dart';
import 'view/dashboard_view.dart';

import 'view/simple_interest.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Riverpod state management',
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardView(),
          '/counter': (context) => const CounterView(),
          '/add': (context) => const AddView(),
          '/si': (context) => const SimpleInterestView(),
           '/student': (context) => const AddStudentView(),
      
        },
      ),
    ),
  );
}
