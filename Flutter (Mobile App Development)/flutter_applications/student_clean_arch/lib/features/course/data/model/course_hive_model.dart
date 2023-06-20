import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';

// part should be below import!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
part 'course_hive_model.g.dart'; //generates adapter. To deal with byte data in Hive.
//generate adapter file
// dart run build_runner build --delete-conflicting-outputs

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel{

  @HiveField(0)
  final String? courseId;

  @HiveField(1)
  final String? courseName;

  CourseHiveModel.empty() : this(courseId: '', courseName: '');

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

  @override
  String toString() {
    return 'courseId: $courseId, courseNam: $courseName';
  }
}