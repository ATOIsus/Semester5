import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:student_clean_arch/model/batch.dart';
import 'package:student_clean_arch/model/course.dart';
import 'package:student_clean_arch/state/course_state.dart';

import '../state/batch_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(
    height: 20,
  );

  final List<Batch> _lstBatch = BatchState.lstBatch;
  final List<Course> _lstCourses = CourseState.lstCourses;

  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late Batch _batch;
  final List<String> _lstChosenCourses = [];
  List<Course> chosenCourse = [];

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    _fNameController.text = '';
    _lNameController.text = '';
    _phoneController.text = '';
    _usernameController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                controller: _fNameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: "First Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter First Name';
                  }
                  return null;
                },
              ),
              _gap,
              TextFormField(
                controller: _lNameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: "Last Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Last Name';
                  }
                  return null;
                },
              ),
              _gap,
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Phone number"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              _gap,
              DropdownButtonFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Please select a batch';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Select Batch',
                  border: OutlineInputBorder(),
                ),
                items: _lstBatch
                    .map(
                      (batch) => DropdownMenuItem(
                        value: batch,
                        child: Text(batch.batchName!),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _batch = value!;
                  });
                },
              ),
              _gap,
              MultiSelectDialogField(
                items: _lstCourses
                    .map((e) => MultiSelectItem(e, e.courseName!))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  _lstChosenCourses.clear();
                  print(values);
                  chosenCourse = values;
                  for (var i = 0; i < chosenCourse.length; i++) {
                    _lstChosenCourses.add(chosenCourse[i].courseId!);
                  }

                  chosenCourse = [];
                },
              ),
              _gap,
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Username';
                  }
                  return null;
                },
              ),
              _gap,
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
              ),
              _gap,
              _gap,
              _gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        var fName = _fNameController.text.trim();
                        var lName = _lNameController.text.trim();
                        var phone = _phoneController.text.trim();
                        var username = _usernameController.text.trim();
                        var password = _passwordController.text.trim();
                        _batch;
                        _lstChosenCourses;

                        print(
                            "$fName \n $lName \n $phone \n $username \n $password \n $_batch \n  $_lstChosenCourses");
                        Navigator.pushNamed(context, '/login');
                      }
                    },
                    child: const Text('Register')),
              )
            ],
          ),
        ),
      )),
    );
  }
}
