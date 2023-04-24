import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(height: 8),
         
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                  Navigator.pushNamed(context, '/arithmeticRoute');
              },
              child: const Text('Arithmetic'),
            ),
          ),
           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {   
                Navigator.pushNamed(context, '/siRoute');    
              },
              child: const Text('Simple Interest'),
            ),
          ),
          
          const SizedBox(height: 8),

           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {   
                Navigator.pushNamed(context, '/circleRoute');    
              },
              child: const Text('Circle'),
            ),
          ),
                         
          const SizedBox(height: 8),

           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {   
                Navigator.pushNamed(context, '/displayRoute');    
              },
              child: const Text('Display Name'),
            ),
          ),
                  
        ]),
      ),
    );
  }
}