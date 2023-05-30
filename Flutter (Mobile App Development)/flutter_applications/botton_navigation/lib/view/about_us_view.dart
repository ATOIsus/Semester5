import 'package:flutter/material.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
      ),
          body: const SafeArea(
            child: Center(
              child: Text("About Us"),
              ),
              ),
    );
  }
}