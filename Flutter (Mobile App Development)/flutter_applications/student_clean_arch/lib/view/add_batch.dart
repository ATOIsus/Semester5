import 'package:flutter/material.dart';

import '../model/batch.dart';
import '../state/batch_state.dart';

class SelectBatchView extends StatefulWidget {
  const SelectBatchView({super.key});

  @override
  State<SelectBatchView> createState() => _SelectBatchViewState();
}

class _SelectBatchViewState extends State<SelectBatchView> {
  final _batchNameController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final List<Batch> _lstBatch = BatchState.lstBatch;

  @override
  void initState() {
    _batchNameController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _batchNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Batch"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _batchNameController,
                    decoration: const InputDecoration(labelText: "Batch name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Batch Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            _lstBatch.add(Batch(
                              batchId: '${_lstBatch.length + 10}',
                              batchName: _batchNameController.text.trim(),
                            ));
                            print(_lstBatch);
                          }
                        },
                        child: const Text('Add Batch')),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/addCourse');
                        },
                        child: const Text('Add Course')),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
