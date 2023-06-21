import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/network/remote/http_service.dart';
import 'package:hive_and_api_for_class/features/course/data/model/course_api_model.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/dto/get_all_course_dto.dart';
import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';

// If .watch is used, don't use autoDispose!!!!!!!!!!!!
final courseRemoteDataSourceProvider = Provider.autoDispose((ref) =>
    CourseRemoteDataSource(
        dio: ref.read(httpServiceProvider),
        courseApiModel: ref.read(courseApiModelProvider)));

class CourseRemoteDataSource {
  final Dio dio;
  final CourseApiModel courseApiModel;

  CourseRemoteDataSource({required this.dio, required this.courseApiModel});

//Add course

  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createCourse,
        data: {"courseName": course.courseName},
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(error: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return left(Failure(error: e.message.toString()));
    }
  }

  //Get course

  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllCourse);
      // check for status code
      if (response.statusCode == 200) {
        print(response.data);
        GetAllCourseDto getAllCourseDto = GetAllCourseDto.fromJson(response.data);
        // convert model to entity
        return Right(courseApiModel.toEntityList(getAllCourseDto.data));
      } else {
        return Left(Failure(error: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return left(Failure(error: e.message.toString()));
    }
  }
}
