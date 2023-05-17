import 'package:flutter/material.dart';

import '../state/batch_state.dart';

class DashbaordView extends StatefulWidget {
  const DashbaordView({super.key});

  @override
  State<DashbaordView> createState() => _DashbaordViewState();
}

class _DashbaordViewState extends State<DashbaordView> {
  var lstBatch = BatchState.batches;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: lstBatch.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onDoubleTap: () => {
                      Navigator.pushNamed(
                        context,
                        '/studentDetailRoute',
                        arguments: lstBatch[index],
                      )
                    },
                child: createCard(lstBatch[index]));
          }),
    );
  }

  Widget createCard(String text) {
    //In class should be outside the build but inside the class.
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(text,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
