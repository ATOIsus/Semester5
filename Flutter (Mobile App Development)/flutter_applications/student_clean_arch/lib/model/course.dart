class Course {
  String? courseId;
  String? courseName;

  Course({
    required this.courseId,
    required this.courseName,
  });

  
  @override
  String toString() {
    return '$courseId, $courseName';
  }
}
