import 'package:flutter_arithematics/features/auth/presentation/viewmodel/arith.dart';
import 'package:flutter_test/flutter_test.dart';


// flutter test .\test\unit_test\ --coverage
// After coverage folder is made.
// flutter pub run test_cov_console

// Coverage is only used for unit testing !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


void main() {
  // test('first test', () {
  //   int a = 2;
  //   int b = 2;

  //   expect(a, b);
  // });

  group('Arithmetic test', () {
    test('add 2 numbers', () {
      final arithObj = Arith(first: 3, second: 4);
      int expectedValue = 7;
      int actualValue = arithObj.add();

      expect(actualValue, expectedValue);
    });

    test('sub 2 numbers', () {
      final arithObj = Arith(first: 3, second: 4);
      int expectedValue = -1;
      int actualValue = arithObj.sub();

      expect(actualValue, expectedValue);
    });
  });

  group('Arithmetic test 2', () {
    test('multiply 2 numbers', () {
      final arithObj = Arith(first: 3, second: 4);
      int expectedValue = 12;
      int actualValue = arithObj.mul();

      expect(actualValue, expectedValue);
    });
  });
}
