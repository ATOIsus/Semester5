import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userSharedPrefsProvider = Provider<UserSharedPrefs>((ref) {
  return UserSharedPrefs();
});

class UserSharedPrefs{

  late SharedPreferences _sharedPreferences;

  Future<Either<Failure, bool>> setUserToken(String token) async{
    try{
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);
      return right(true);
    } catch (e){
      return left(Failure(error: e.toString()));
    }
  }

  
  Future<Either<Failure, String?>> getUserToken() async{
    try{
      _sharedPreferences = await SharedPreferences.getInstance();
      final token = _sharedPreferences.getString('token');
     
      return (right(token));
    } catch (e){
      return left(Failure(error: e.toString()));
    }
  }



}