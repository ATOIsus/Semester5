import 'package:flutter/material.dart';
import 'package:student_batch/state/student_state.dart';

class StudentDetailView extends StatefulWidget {
  const StudentDetailView({super.key});

  @override
  State<StudentDetailView> createState() => _StudentDetailViewState();
}

class _StudentDetailViewState extends State<StudentDetailView> {
  var lstStudent = StudentState.students;

  var passedBatch;

  @override
  void didChangeDependencies() {
    passedBatch = ModalRoute.of(context)!.settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisCount: 2,
          children: [
            for (int i = 0; i < lstStudent.length; i++) ...{
              if (lstStudent[i].batch == passedBatch) ...{
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: Center(
                        child: Text(
                            "${lstStudent[i].studentId} \n ${lstStudent[i].fname}  ${lstStudent[i].lname} ${lstStudent[i].batch}")),
                  ),
                ),
              }
            }
          ],
        ),
      ),
    );
  }
}
