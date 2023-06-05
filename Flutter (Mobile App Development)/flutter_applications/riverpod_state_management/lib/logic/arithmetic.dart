import 'package:flutter_riverpod/flutter_riverpod.dart';

final arithmeticProvider = Provider<Arithmetic>((ref) => Arithmetic());


class Arithmetic {
  int add(int a, int b) {
    return a + b;
  }

  int sub(int a, int b) {
    return a - b;
  }

  int mul(int a, int b) {
    return a * b;
  }

  int div(int a, int b) {
    return a ~/ b;
  }
}
