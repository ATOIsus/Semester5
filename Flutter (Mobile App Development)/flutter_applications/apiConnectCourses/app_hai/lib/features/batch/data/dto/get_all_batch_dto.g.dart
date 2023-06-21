// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_batch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBatchDto _$GetAllBatchDtoFromJson(Map<String, dynamic> json) =>
    GetAllBatchDto(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => BatchApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBatchDtoToJson(GetAllBatchDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
