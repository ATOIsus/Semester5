import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String? courseId;
  final String courseName;

  const CourseEntity({
    this.courseId,
    required this.courseName,
  });

  factory CourseEntity.fromJson(Map<String, dynamic> json) {
    return CourseEntity(
      courseId: json['courseId'] as String?,
      courseName: json['courseName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'courseName': courseName,
    };
  }
  
  @override
  List<Object?> get props => [courseId, courseName];
}
