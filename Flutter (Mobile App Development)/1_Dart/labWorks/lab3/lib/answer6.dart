//6. Write a dart program demonstrating the use of an abstract class.

abstract class absClass{

  void printDetails();

}

class implentClass extends absClass{

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
