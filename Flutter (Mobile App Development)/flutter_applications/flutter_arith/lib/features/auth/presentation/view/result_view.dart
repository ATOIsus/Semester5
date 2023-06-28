// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
 

  var args;
 
  @override
  void didChangeDependencies() {
    
    args = ModalRoute.of(context)!.settings.arguments as int?;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text("Result:   $args "))
            ),
          ),
        ),
      ),
    );
  }
}
