import 'package:flutter/material.dart';

import '../model/student.dart';

class PayDueView extends StatefulWidget {
  const PayDueView({super.key});

  @override
  State<PayDueView> createState() => _PayDueViewState();
}

class _PayDueViewState extends State<PayDueView> {
  List<Student> lstStudent = [];

  @override
  void didChangeDependencies() {
    lstStudent = ModalRoute.of(context)!.settings.arguments as List<Student>;
    super.didChangeDependencies();
  }

  void payDueAmount({String studentId = "", int paidAmount = 0}) {
    for (var i = 0; i < lstStudent.length; i++) {
      if (lstStudent[i].sid == studentId) {
        lstStudent[i].dueAmount -= paidAmount;
        Navigator.pushNamed(
          context,
          '/dashboard',
          arguments: lstStudent,
        );
        return;
      }
    }
  }

  final gap = const SizedBox(height: 8);

  final studentIdController = TextEditingController();
  final dueAmountController = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Due'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: studentIdController,
                  decoration: const InputDecoration(
                    labelText: 'Student Id',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter student ID';
                    }
                    return null;
                  },
                ),
                gap,
                TextFormField(
                  controller: dueAmountController,
                  decoration: const InputDecoration(
                    labelText: 'Pay Amount',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter paying amount please';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        String studentId = studentIdController.text;
                        int dueAmount = int.parse(dueAmountController.text.trim());

                        payDueAmount(studentId: studentId, paidAmount: dueAmount);
                      }
                    },
                    child: const Text('Pay Due Amount'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Student added successfully'),
//                           ),
//                         );