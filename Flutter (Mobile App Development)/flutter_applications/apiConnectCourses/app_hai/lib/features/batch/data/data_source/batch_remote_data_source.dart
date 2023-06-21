import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/network/remote/http_service.dart';
import 'package:hive_and_api_for_class/features/batch/data/dto/get_all_batch_dto.dart';
import 'package:hive_and_api_for_class/features/batch/data/model/batch_api_model.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
// If .watch is used, don't use autoDispose!!!!!!!!!!!!
final batchRemoteDataSourceProvider = Provider.autoDispose((ref) =>
    BatchRemoteDataSource(
        dio: ref.read(httpServiceProvider),
        batchApiModel: ref.read(batchApiModelProvider)));

class BatchRemoteDataSource {
  final Dio dio;
  final BatchApiModel batchApiModel;

  BatchRemoteDataSource({required this.dio, required this.batchApiModel});

//Add batch

  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createBatch,
        data: {"batchName": batch.batchName},
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

  //Get Batch

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllBatch);
      // check for status code
      if (response.statusCode == 200) {
        GetAllBatchDto getAllBatchDto = GetAllBatchDto.fromJson(response.data);
        // convert model to entity
        return Right(batchApiModel.toEntityList(getAllBatchDto.data));
      } else {
        return Left(Failure(error: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return left(Failure(error: e.message.toString()));
    }
  }
}
