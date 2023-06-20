import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, '/register');
    });

    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}