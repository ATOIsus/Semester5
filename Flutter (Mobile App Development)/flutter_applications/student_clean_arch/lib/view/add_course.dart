import 'package:flutter/material.dart';

import '../model/course.dart';
import '../state/course_state.dart';

class AddCourseView extends StatefulWidget {
  const AddCourseView({super.key});

  @override
  State<AddCourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {
  final _courseNameController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final List<Course> _lstCourses = CourseState.lstCourses;

  @override
  void initState() {
    _courseNameController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Course"),
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
                  controller: _courseNameController,
                  decoration: const InputDecoration(labelText: "Course name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Course Name';
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
                          _lstCourses.add(Course(
                              courseId: '${_lstCourses.length + 10}',
                              courseName: _courseNameController.text.trim()));
                        }
                        print(_lstCourses);
                      },
                      child: const Text('Add Course')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
