import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'batch_api_model.g.dart';

final batchApiModelProvider = Provider((ref) => BatchApiModel.empty());

@JsonSerializable()
class BatchApiModel {
  @JsonKey(name: '_id')
  final String? batchId;
  final String batchName;

  BatchApiModel({required this.batchId, required this.batchName});


  BatchApiModel.empty(): this( batchId : "" , batchName : "");

  // Convert Hive Object to Entity
  BatchEntity toEntity() => BatchEntity(
        batchId: batchId,
        batchName: batchName,
      );

  // Convert Entity to Hive Object
  BatchApiModel toHiveModel(BatchEntity entity) => BatchApiModel(
        batchId: entity.batchId,
        batchName: entity.batchName,
      );

  // Convert Hive List to Entity List
  List<BatchEntity> toEntityList(List<BatchApiModel> models) =>
      models.map((model) => model.toEntity()).toList();


  // To JSON
  Map<String, dynamic> toJson() => _$BatchApiModelToJson(this);

  // From JSON
  factory BatchApiModel.fromJson(Map<String, dynamic> json) => _$BatchApiModelFromJson(json);



  @override
  String toString() {
    return 'batchId: $batchId, batchName: $batchName';
  }

}
