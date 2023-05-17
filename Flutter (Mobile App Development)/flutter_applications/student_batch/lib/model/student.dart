import 'package:uuid/uuid.dart';

class Student{

  final String?  studentId;
  final String?  fname;
  final String?  lname;
  final String?  age;
  final String?  username;
  final String?  password;
  final String?  batch;



  
  Student({
    String? studentId,
    this.fname,
    this.lname,
    this.age,
    this.username,
    this.batch,
    this.password,
  }) : studentId = studentId ?? const Uuid().v4();



}