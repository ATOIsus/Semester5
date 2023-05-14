import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisCount: 2,
          children:  [
          
            for(int i=0 ; i < 10; i++)  SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Center(child: Text("I am inside this card $i")),
                ),
              ),
      
               
      
      
      
          ],
          
          ),
      ),


    );
  }
}