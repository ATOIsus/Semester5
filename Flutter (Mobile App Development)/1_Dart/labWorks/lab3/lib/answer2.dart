//2. Write a dart program to create a class House with properties [id, name, prize]. 
// Create a constructor of it and create 3 objects of it. 
// Add them to the list and print all the details.


// ignore_for_file: prefer_typing_uninitialized_variables

class House {
  var id;
  var name;
  var prize;

  House(this.id, this.name, this.prize);

  void printDetails(){
    print("$name house with id $id is of prize $prize.");
  }

}



void main(){
  var house1 = House(1, "Acer", 8);
  var house2 = House(2, "Dell", 16);
  var house3 = House(3, "name", 4);
  

  List<House> lst = [house1, house2, house3]; 

  for (House i in lst){
    i.printDetails();
  }
}
