
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';



void main(){

  runApp(
    MaterialApp(

      debugShowCheckedModeBanner: false,


        home: Scaffold(
                    
              appBar: AppBar(
                title: Text("Calculate Simple Interest"),
                centerTitle: true,
              ),
        
          body: SingleChildScrollView(
            
            
            child: Padding(
                  padding: EdgeInsets.all(8.0),   
                  
                child: Column(
                  children: [
                  
                            SizedBox(height: 12),
                  
                            TextField(
                              decoration: InputDecoration(
                                          labelText: "Enter the Principle",  
                                          border: OutlineInputBorder(
                                                     borderRadius: BorderRadius.circular(10),
                                                    ),    
                              ),
                            ),
                  
                  
                            SizedBox(height: 12),
                  
                            TextField(
                              decoration: InputDecoration(
                                          labelText: "Enter the Interest",  
                                          border: OutlineInputBorder(
                                                     borderRadius: BorderRadius.circular(10),
                                                    ),        
                              ),
                            ),
                  
                            SizedBox(height: 12),
                  
                            TextField(
                              decoration: InputDecoration(
                                          labelText: "Enter the Rate",
                                          border: OutlineInputBorder(
                                                     borderRadius: BorderRadius.circular(10),
                                                    ),          
                              ),
                            ),
                            
                              SizedBox(height: 12),
                  
                              SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Simple Interest'),
                  ),
                ),
                  
                            SizedBox(height: 12),
                  
                            Text('Simple Interest is 0.',
                                  style : TextStyle(
                                                fontSize: 20,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold
                                ),
                              ),
                    
                  ],
              
                ),
              ),
          ),
          ),
        ),
  );
}