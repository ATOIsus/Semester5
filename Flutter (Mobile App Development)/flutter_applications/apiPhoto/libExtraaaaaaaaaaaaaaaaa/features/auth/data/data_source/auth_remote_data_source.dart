



import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/network/remote/http_service.dart';


final authRemoteDataSourceProvider = Provider((ref) => AuthRemoteDataSource(dio: ref.read(httpServiceProvider)));

class AuthRemoteDataSource{
  final Dio dio;

  AuthRemoteDataSource({required this.dio});
}