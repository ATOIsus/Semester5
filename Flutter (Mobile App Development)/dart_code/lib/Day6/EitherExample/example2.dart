

import 'package:dartz/dartz.dart';

class ExampleSecond{
  Either<String, String> extractValue(String message){
    try{
      return Right(message[9]);
    }catch(e){
      return Left(e.toString());
    }
  }
}

void main(){
  ExampleSecond obj = ExampleSecond();
  print(obj.extractValue("smth"));
}