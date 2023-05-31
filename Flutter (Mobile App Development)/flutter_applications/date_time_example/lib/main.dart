// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'app.dart';
import 'di/di.dart';

void main() {
  initModule();

  runApp(
    const App(),
  );
}
