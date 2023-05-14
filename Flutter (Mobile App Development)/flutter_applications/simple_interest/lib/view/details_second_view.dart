import 'package:flutter/material.dart';

class DetailsSecondView extends StatefulWidget {
  const DetailsSecondView({super.key});

  @override
  State<DetailsSecondView> createState() => _DetailsSecondViewState();
}

class _DetailsSecondViewState extends State<DetailsSecondView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Card View'),
      ),

      body: ListTile(
        leading: const Icon(Icons.start),
        title: const Text('Some one'),
        subtitle: const Text("sdss dsssd"),
        trailing: const Icon(Icons.delete),
        onTap: (){}

      )


    );
  }
}