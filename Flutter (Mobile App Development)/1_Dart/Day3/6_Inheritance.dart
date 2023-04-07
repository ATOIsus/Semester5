// April 5, 2023


class parentClass{

  String parentProperty1;
  String parentProperty2;

  parentClass(this. parentProperty1, this.parentProperty2);

  void showProperty() {
    print("Parent property 1: $parentProperty1, parent property 2: $parentProperty2");
  }

}

class childClass extends parentClass{
  String? childProperty;

  childClass({property1, property2, this.childProperty}) : super(property1, property2);

  // toString is an existing method, it returns the below string instead of the instance of the class. 
  @override
  String toString() => "Parent property 1: $parentProperty1, parent property 2: $parentProperty2, child property : $childProperty";

}


void main(){
  var cClassObj = childClass( property1: "House", property2 : "Car", childProperty: "Nothing");
  print(cClassObj);
}

