import 'package:flutter/material.dart';
import 'package:listview_batch30/view/output_view.dart';
import 'package:listview_batch30/view/student_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Details',
      initialRoute: '/',
      routes: {
        '/': (context) => const StudentView(),
        '/outputRoute': (context) => const OutputView(),
      },
    ),
  );
}
