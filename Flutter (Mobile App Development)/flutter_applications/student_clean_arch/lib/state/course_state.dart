import '../model/course.dart';

class CourseState {
  CourseState._();
  static List<Course> lstCourses = [
    Course(courseId: "1", courseName: "Mobile App Dev"),
    Course(courseId: "2", courseName: "Web API"),
    Course(courseId: "3", courseName: "Design Thinking"),
  ];
}
