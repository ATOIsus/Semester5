import 'batch.dart';
import 'course.dart';

class Student {
  String? fName;
  String? lName;
  String? phone;
  Batch? batch;
  List<Course>? lstCourses;
  String? username;
  String? password;

  Student({
    required this.fName,
    required this.lName,
    required this.phone,
    required this.batch,
    required this.lstCourses,
    required this.username,
    required this.password,
  });

  @override
  String toString() {
    return '$fName, $lName, $phone, $batch, $lstCourses, $username, $password';
  }
}
