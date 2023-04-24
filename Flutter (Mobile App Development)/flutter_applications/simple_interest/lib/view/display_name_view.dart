import 'package:flutter/material.dart';
import '../model/display_name_model.dart';

class DisplayNameView extends StatefulWidget {
  const DisplayNameView({super.key});

  @override
  State<DisplayNameView> createState() => _DisplayNameViewState();
}

class _DisplayNameViewState extends State<DisplayNameView> {

  int counter = 0;
  String name = "asd";
  late DisplayNameModel obj;

  void changeName(){
    obj = DisplayNameModel();
    setState(() {
       name = obj.displayName(counter++);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: SizedBox(
          width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                changeName();
              },
              child: Text('Click Me!  ($name)'),
            ),
        ),
      )
    );
      
  }
}