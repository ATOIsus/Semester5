import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvvm_pattern/view_model/view_model.dart';

import '../model/student.dart';

class AddStudentView extends ConsumerStatefulWidget {
  const AddStudentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddStudentViewState();
}

class _AddStudentViewState extends ConsumerState<AddStudentView> {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final dobController = TextEditingController();

  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(studentViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: myKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                TextFormField(
                  controller: fNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter first name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: lNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter last name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: dobController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter DOB',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter DOB';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (myKey.currentState!.validate()) {
                        var student = Student(
                          fname: fNameController.text.trim(),
                          lname: lNameController.text.trim(),
                          dob: dobController.text.trim(),
                        );
      
                        ref
                            .read(studentViewModelProvider.notifier)
                            .addStudent(student);
      
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Student Added"),
                          backgroundColor: Colors.green,
                        ));
                      }
                    },
                    child: const Text('ADD'),
                  ),
                ),
                data.students.isNotEmpty
                    ? Container(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: data.students.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(data.students[index].fname!),
                                subtitle: Text(data.students[index].lname!),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete),
                                    )
                                  ],
                                ),
                              );
                            }),
                      )
                    : const Text('Data chaina bhai')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
