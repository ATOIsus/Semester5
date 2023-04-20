// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter smth', //hintText can be used as well
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter another thing',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add Btn'),
              ),
            ),
            Text(
              'Sum is 0',
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    ),
  );
}



// Single Child 

// runApp(
//      MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World')
//           ),
//       ),
//     ),
//   );


// Multiple Child

//  runApp(
//      MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Title"),
//           centerTitle: true,
//           elevation: 0,
//         ),
//         body: Column(
//           children: [
//             Text('Hello World'),
//             Text('Welcome')]
//           ),
//       ),
//     ),
//   );


// MaterialApp: The actual app.
// Scaffold: Area 

//Everything is a child in the UI part.

