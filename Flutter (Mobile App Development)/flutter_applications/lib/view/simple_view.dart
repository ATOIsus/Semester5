import 'package:flutter/material.dart';
import 'package:simple_interest/model/simple_model.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final principleController = TextEditingController();
  final timeController = TextEditingController();
  final rateController = TextEditingController();
  double interest = 0;

  final myKey = GlobalKey();
  late SimpleInterestModel obj;

  
  @override
  void initState() {
    principleController.text = '67';
    timeController.text = '89';
    rateController.text = '89';
    super.initState();
  }

  @override
  void dispose() {
    principleController.dispose();
    timeController.dispose();
    rateController.dispose();
    super.dispose();
  }

  void simpleInterest() {
    obj = SimpleInterestModel();
    setState(() {
      interest = obj.simpleInterest(
          principle: double.parse(principleController.text),
          time: double.parse(timeController.text),
          rate: double.parse(principleController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculate Simple Interest Program"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: myKey,
            child: Column(
              children: [
                const SizedBox(height: 12),
                TextFormField(
                  controller : principleController,
                  decoration: InputDecoration(
                    labelText: "Enter the principle",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: "Enter the time",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: rateController,
                  decoration: InputDecoration(
                    labelText: "Enter the ate",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      simpleInterest();
                    },
                    child: const Text('Calculate Interest'),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Simple Interest is $interest.',
                  style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
