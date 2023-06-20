import 'package:hive/hive.dart';
import 'package:student_clean_arch/features/batch/data/model/batch_hive_model.dart';
import 'package:student_clean_arch/features/course/data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';

// part should be below import!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
part 'student_hive_model.g.dart'; //generates adapter. To deal with byte data in Hive.
//generate adapter file
// dart run build_runner build --delete-conflicting-outputs

@HiveType(typeId: HiveTableConstant.studentTableId)
class StudentHiveModel {
  @HiveField(0)
  final String? studentId;

  @HiveField(1)
  final String? fName;
  @HiveField(2)
  final String? lName;

  @HiveField(3)
  final String? phone;

  @HiveField(4)
  final String? username;

  @HiveField(5)
  final String? password;

  @HiveField(6)
  final BatchHiveModel batch;

  @HiveField(7)
  final List<CourseHiveModel> courses;

  StudentHiveModel.empty()
      : this(
            studentId: '',
            fName: '',
            lName: '',
            phone: '',
            batch: BatchHiveModel.empty(),
            courses: [],
            username: '',
            password: '');

  StudentHiveModel({
    String? studentId,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  @override
  String toString() {
    return 'studentId: $studentId, fNam: $fName';
  }
}
