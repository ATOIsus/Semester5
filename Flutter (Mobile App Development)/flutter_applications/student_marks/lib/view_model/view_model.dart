import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/student.dart';
import '../state/student_state.dart';

final studentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
  (ref) => StudentViewModel(),
);

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.initialState()) {
    getAllStudents();
  }

  void addStudent(Student student) {
    state = state.copyWith(isLoading: true);
    state.students.add(student);
    state = state.copyWith(isLoading: false);
  }

  void getAllStudents() {
    state = state.copyWith(isLoading: true);
    state.students = [
      Student(fname: 'John', lname: 'Don', studentMarks: {
        "API": 80,
        "Flutter ": 80,
        "Design": 80,
        "Individual": 80
      }),

    ];
    state = state.copyWith(isLoading: false);
  }

}
