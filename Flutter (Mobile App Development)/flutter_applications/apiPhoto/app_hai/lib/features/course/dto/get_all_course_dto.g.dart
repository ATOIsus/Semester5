// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCourseDto _$GetAllCourseDtoFromJson(Map<String, dynamic> json) =>
    GetAllCourseDto(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => CourseApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCourseDtoToJson(GetAllCourseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
