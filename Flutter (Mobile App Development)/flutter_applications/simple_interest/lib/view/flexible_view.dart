import 'package:flutter/material.dart';

class FlexibleView extends StatefulWidget {
  const FlexibleView({super.key});

  @override
  State<FlexibleView> createState() => _FlexibleViewState();
}

class _FlexibleViewState extends State<FlexibleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Rows and Columns")),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                
                children: [
                  Expanded(
                    child: Container(
                      
                      color: Colors.blue,
                      child: const Center(child: Text("Container1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                         width: double.infinity,
                      color: Colors.red,
                      child: const Center(child: Text("Container2")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                         width: double.infinity,
                      color: Colors.blue,
                      child: const Center(child: Text("Container3")),
                    ),
                  )
                ],
              ),
            ),
           
      
            Expanded(
              child: Container(
                 alignment: Alignment.center,
                width: double.infinity,
                color: Colors.purple,
                child: const Text("Container1"),
              ),
            ),
            
            Expanded(
              child: Container(
                 alignment: Alignment.center,
                width: double.infinity,
                color: Colors.blue,
                child: const Text("Container2"),
              ),
            ),

              Expanded(
              child: Container(
                 alignment: Alignment.center,
                width: double.infinity,
                color: Colors.purple,
                child: const Text("Container3"),
              ),
            ),




          ],
        ));
  }
}
