import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/add_student_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'MVVM pattern',
        initialRoute: '/',
        routes: {
          '/': (context) => const AddStudentView(),
  
        },
      ),
    ),
  );
}