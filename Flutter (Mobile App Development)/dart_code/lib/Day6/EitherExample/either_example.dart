import 'package:dartz/dartz.dart';

class EitherExm {
  final int first;
  final int second;

  EitherExm(this.first, this.second);

  int sub() {
    return first - second;
  }

  Either<String, double> divide() {
    try {
      //print((first / second).runtimeType); // Infinity of type double is returned.
      return Right(first / second);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

void main() {
  EitherExm obj = EitherExm(2, 0);
  print(obj.sub());

  var res = obj.divide();

  res.fold(
    (l) => print("Error occured: $l"),
    (r) => print("Division is $r"),
  );
}
