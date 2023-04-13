//6. Write a dart program demonstrating the use of an abstract class.

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

abstract class AbsClass{

  void printDetails();

}

class implentClass extends AbsClass{

  var name;
  var age;
  var address;

  implentClass(this.name, this.age, this.address);


  @override
  void printDetails(){
    print("$name of age $age lives in $address");
  }

}


void main(){
  var obj = implentClass("Nmasee", 333, "somewhere");
  obj.printDetails();
}
