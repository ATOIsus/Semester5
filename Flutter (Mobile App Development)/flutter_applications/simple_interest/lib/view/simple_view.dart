


import 'package:flutter/material.dart';
import 'package:simple_interest/model/simple_model.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  
  double principle = 0;
  double time = 0;
  double rate = 0;
  double interest = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                    
              appBar: AppBar(
                title: Text("Calculate Simple Interest Program"),
                centerTitle: true,
              ),
        
          body: SingleChildScrollView(
            
            
            child: Padding(
                  padding: EdgeInsets.all(8.0),   
                  
                child: Column(
                  children: [
                  
                            SizedBox(height: 12),
                  
                            TextField(
                              onChanged: (value){
                                principle = double.parse(value);
                              },
                              decoration: InputDecoration(
                                          labelText: "Enter the Principle",  
                                          border: OutlineInputBorder(
                                                     borderRadius: BorderRadius.circular(10),
                                                    ),    
                              ),
                            ),
                  
                  
                            SizedBox(height: 12),
                  
                            TextField(
                                onChanged: (value) {
                                time = double.parse(value);
                              },
                              decoration: InputDecoration(
                                          labelText: "Enter the Time",  
                                          border: OutlineInputBorder(
                                                     borderRadius: BorderRadius.circular(10),
                                                    ),        
                              ),
                            ),
                  
                            SizedBox(height: 12),
                  
                            TextField(
                               onChanged: (value) {
                               rate = double.parse(value);
                },
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
                                       onPressed: () {
                                            setState(() {
                                            SimpleInterestModel obj = SimpleInterestModel();
                                            interest = obj.simpleInterest(principle: principle, time: time, rate: rate);
                                      });
                                    },
                                      
                                      child: Text('Calculate Interest'),
                  ),
                ),
                  
                            SizedBox(height: 12),
                  
                            Text('Simple Interest is $interest.',
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
          );
  }
}