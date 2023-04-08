// April 5, 2023

//Class name can be different from hte file name in dart.
class newClass {
  int a;
  int b;

  newClass(this.a, this.b);

  int add() {
    return a + b;
  }

  int multiply() {
    return a * b;
  }


  
  //Arrow Function 
  // For single line return statement.

  double division() => a / b;

}

void main() {

  //Creating an object
  newClass cls = newClass(2, 3);

  int a = cls.add();
  print("sum is $a");

  print("Product is ${cls.multiply()}");

  cls.b = 30;
  print("sum is ${cls.add()}");

  print("Division is ${cls.division()}");
}
