import 'package:flutter/material.dart';

import '../../../../config/router/app_route.dart';
import '../viewmodel/arith.dart';

class ArithView extends StatefulWidget {
  const ArithView({super.key});

  @override
  State<ArithView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<ArithView> {
  final _gap = const SizedBox(height: 8);
  var result;

  final _key = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

  late Arith obj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arith'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstController,
                    decoration: const InputDecoration(
                      labelText: 'First No',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first no';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _secondController,
                    decoration: const InputDecoration(
                      labelText: 'Second No',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter second no';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          obj = Arith(
                              first: int.parse(_firstController.text.trim()),
                              second: int.parse(_secondController.text.trim()));

                          var sum = obj.add();

                          setState(() {
                            result = sum;
                          });
                          // Navigator.pushNamed(context, AppRoute.resultRoute,
                          //     arguments: sum);
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          obj = Arith(
                              first: int.parse(_firstController.text.trim()),
                              second: int.parse(_secondController.text.trim()));

                          var difference = obj.sub();

                          
                          // setState(() {
                          //   result = difference;
                          // });

                          Navigator.pushNamed(context, AppRoute.resultRoute,
                              arguments: difference);
                        }
                      },
                      child: const Text('Subtract'),
                    ),
                  ),
                  _gap,
                  Text("Result: $result")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
