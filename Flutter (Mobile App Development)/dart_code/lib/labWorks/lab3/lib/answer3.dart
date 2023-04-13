//3. Write a dart program to create a class Animal with properties [id, name, color]. 
//Create another class called Cat and extends it from Animal. 
//Add new properties sound in String. 
//Create an object of a Cat and print all details.


// ignore_for_file: prefer_typing_uninitialized_variables

class Animal{
  var id;
  var name;
  var color;

  Animal(this.id, this.name, this.color);
}


class Cat extends Animal{
  String sound = "";
  Cat(super.id, super.name, super.color, this.sound);


  void printDetails(){
    print("$name is a cat with id $id, color $color and sound $sound.");
  }

}


void main(){
  var catObj = Cat(1, "Kitten", "White", "Meow");
  catObj.printDetails();
}