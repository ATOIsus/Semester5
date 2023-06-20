import '../model/student.dart';

class StudentState {
  bool isLoading;
  List<Student> students;
  String? error;

  StudentState({required this.isLoading, required this.students, this.error});

  StudentState.initialState() : this(isLoading: false, students: []);

  StudentState copyWith(
      {bool? isLoading, List<Student>? students, String? error}) {
    return StudentState(
      isLoading: isLoading ?? this.isLoading,
      students: students ?? this.students,
      error: error ?? this.error,
    );
  }
}
