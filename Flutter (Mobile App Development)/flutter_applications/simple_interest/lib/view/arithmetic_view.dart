import 'package:flutter/material.dart';
import 'package:simple_interest/model/arithmetic_model.dart';

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

  late ArithmeticModel obj; // Late initialization.

  void addFun(){
     obj = ArithmeticModel(); // Before setState because setState rebuilds the UI.
     setState(() {
                  add = obj.add(first: first, second: second);
      });
  }
  
  void subFun(){
     obj = ArithmeticModel();
     setState(() {
                  add = obj.subtract(first: first, second: second);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(height: 8),
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
          const SizedBox(height: 8),
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
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
               addFun();
              },
              child: const Text('Add'),
            ),
          ),
           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                subFun();
              },
              child: const Text('Sub'),
            ),
          ),
                    const SizedBox(height: 8),
           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ArithmeticModel obj = ArithmeticModel();
                  div = obj.divide(first: first, second: second);
                });
              },
              child: const Text('Divide'),
            ),
          ),
                    const SizedBox(height: 8),

          Text(
            'Sum is $add',
            style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
                    const SizedBox(height: 8),

          Text(
            'Subtraction is $sub',
            style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
                    const SizedBox(height: 8),

          Text(
            'Division is $div',
            style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
