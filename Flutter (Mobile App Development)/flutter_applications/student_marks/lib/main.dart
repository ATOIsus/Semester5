import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/add_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Student Marksheet',
        initialRoute: '/',
        routes: {
          '/': (context) => const AddStudentView(),
  
        },
      ),
    ),
  );
}