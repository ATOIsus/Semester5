import 'package:flutter/material.dart';

class OutputView extends StatefulWidget {
  const OutputView({super.key});

  @override
  State<OutputView> createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView> {

  int? result;

  @override
  void didChangeDependencies() {
    
    result = ModalRoute.of(context)!.settings.arguments as int?;
    super.didChangeDependencies();
  }

 
  @override
  Widget build(BuildContext context) {

     //result = ModalRoute.of(context)!.settings.arguments as int?; Not a good practice


    return  Scaffold(
      body: Center(child: Text("Result is ${result.toString()}")
      ),
    );
  }
}