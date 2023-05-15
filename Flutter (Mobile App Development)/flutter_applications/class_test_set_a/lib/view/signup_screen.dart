import 'package:flutter/material.dart';

import '../model/student.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final gap = const SizedBox(height: 8);

  List<Student> lstStudent = [];

  // Controllers for TextFormFields
  final studentIdController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  String? gender;
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup View'),
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
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                ),
                gap,
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                gap,
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter age';
                    }
                    return null;
                  },
                ),
                gap,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Select gender'),
                ),
                // Create radio button for gender
                RadioListTile(
                  title: const Text('Male'),
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Female'),
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Others'),
                  value: 'Others',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                gap,
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        // Create a student object and add it to the list of students
                        var student = Student(
                          sid: studentIdController.text.trim(),
                          fname: firstNameController.text.trim(),
                          lname: lastNameController.text.trim(),
                          gender: gender!,
                          age: int.parse(ageController.text.trim()),
                          password: passwordController.text.trim(),
                        );
                        lstStudent.add(student);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Student added successfully'),
                          ),
                        );
                      }
                    },
                    child: const Text('Add Student'),
                  ),
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/login',
                        arguments: lstStudent,
                      );
                    },
                    child: const Text('Login'),
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
