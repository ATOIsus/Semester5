import 'package:flutter/material.dart';

import '../common/show_my_message.dart';


class MediaQueryView extends StatefulWidget {
  const MediaQueryView({super.key});

  @override
  State<MediaQueryView> createState() => _MediaQueryViewState();
}

class _MediaQueryViewState extends State<MediaQueryView> {



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Column(
          
          children:   [
      
            Flexible(
              fit : FlexFit.tight,
              child: Container(
                width: double.infinity,//double. infinity : Parent widget.
                color: Colors.green,
                child: ElevatedButton(
                  onPressed: () => {showTextHai(context, "Smthhhh")},
              
                  child: const Text("Click me")
                ,)

              ),
            ),
      
            Expanded(
              //fit: FlexFit.tight, //Take additional space
              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: const Text("2"),
              ),
            ),



            //   Container(
            //   height: MediaQuery.of(context).size.height * .3, //MediaQuery: screen size
            //   width: double.infinity,
            //   color: Colors.red,
            //   child: const Text("2"),
            // ),
      
      
          
        ]),
      ),
    );
  }
}