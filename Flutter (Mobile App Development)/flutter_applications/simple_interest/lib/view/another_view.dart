import 'package:flutter/material.dart';

class AnotherView extends StatefulWidget {
  const AnotherView({super.key});

  @override
  State<AnotherView> createState() => _AnotherViewState();
}

class _AnotherViewState extends State<AnotherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Container(// Its size is of Center i.e. of SafeArea i.e. of Scaffold.
            alignment: Alignment.bottomRight,
            child: Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  border: Border.all(
                    color: Colors.red,
                    width: 2,
                  )),
              child: const Text("Hello"),
            ),
          ),
        ),
      )),
    );
  }
}



// Container(
//           height: 200,
//           width: 200,
//           alignment: Alignment.centerRight,
//           color: Colors.green, // Overridden when BoxDecorator is used.
//           child: const Text("Hello")
//           )