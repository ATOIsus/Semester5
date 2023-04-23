import 'package:flutter/material.dart';
import 'package:simple_interest/model/artithmetic_model.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  double first = 0;
  double second = 0;
  double add = 0;
  double sub = 0;
  double div = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onChanged: (value) {
              first = double.parse(value);
            },
            decoration: InputDecoration(
              labelText: 'Enter first number', //hintText can be used as well
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            onChanged: (value) {
              second = double.parse(value);
            },
            decoration: InputDecoration(
              labelText: 'Enter second number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ArithmeticModel obj = ArithmeticModel();
                  add = obj.add(first: first, second: second);
                });
              },
              child: Text('Add'),
            ),
          ),
           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ArithmeticModel obj = ArithmeticModel();
                  sub = obj.subtract(first: first, second: second);
                });
              },
              child: Text('Sub'),
            ),
          ),
                    SizedBox(height: 8),
           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ArithmeticModel obj = ArithmeticModel();
                  div = obj.divide(first: first, second: second);
                });
              },
              child: Text('Divide'),
            ),
          ),
                    SizedBox(height: 8),

          Text(
            'Sum is $add',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
                    SizedBox(height: 8),

          Text(
            'Substraction is $sub',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
                    SizedBox(height: 8),

          Text(
            'Division is $div',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
