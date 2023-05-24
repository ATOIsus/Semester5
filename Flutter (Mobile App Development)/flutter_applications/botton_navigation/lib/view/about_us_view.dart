import 'package:flutter/material.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: SafeArea(
            child: Center(
              child: Text("About Us"),
              ),
              ),
    );
  }
}