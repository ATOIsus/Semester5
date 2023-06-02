import 'package:flutter/material.dart';
import 'package:student_clean_arch/view/add_batch.dart';
import 'package:student_clean_arch/view/login_view.dart';
import 'package:student_clean_arch/view/register_view.dart';

import 'view/add_course.dart';

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
        initialRoute: '/register',
        routes: {
          '/login': (context) => const LogInView(),
          '/register': (context) => const RegisterView(),
          '/addBatch': (context) => const SelectBatchView(),
          '/addCourse': (context) => const AddCourseView(),
        });
  }
}
