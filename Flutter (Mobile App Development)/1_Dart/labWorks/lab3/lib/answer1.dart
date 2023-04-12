//1. Write a dart program to create a class Laptop with properties [id, name, ram] and create 3 objects of it and print all details.


// ignore_for_file: prefer_typing_uninitialized_variables

class Laptop {
  var id;
  var name;
  var ram;


  void printDetails(){
    print("$name with id $id has RAM of $ram GB.");
  }

}



void main(){
  var laptop1 = Laptop();
  laptop1.id  = 1;
  laptop1.name = "Acer";
  laptop1.ram = 8;

  var laptop2 = Laptop();
  laptop2.id  = 2;
  laptop2.name = "Dell";
  laptop2.ram = 12;

  var laptop3 = Laptop();
  laptop3.id  = 3;
  laptop3.name = "Apple";
  laptop3.ram = 16;


  laptop1.printDetails();
  laptop2.printDetails();
  laptop3.printDetails();
}




