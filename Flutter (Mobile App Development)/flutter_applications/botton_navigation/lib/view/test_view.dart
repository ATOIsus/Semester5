import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text("Test"),
        centerTitle: true,
      ),
          body: const SafeArea(
            child: Center(
              child: Text("Test"),
              ),
              ),
    );
  }
}