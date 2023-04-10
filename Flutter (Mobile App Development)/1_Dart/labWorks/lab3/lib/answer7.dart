//7. Write a dart program demonstrating the use of multiple inheritance.


class parent1 {
  void methodParent1(){
    print("Method of parent 1");
  }
}


class parent2 {
  void methodParent2(){
    print("Method of parent 2");
  }
}


class childClass implements parent1, parent2{
  @override
  void methodParent1() {
    print("Inherited method from parent1.");
  }

  @override
  void methodParent2() {
    print("Inherited method from parent2.");
  }

}


void main(){
  var childClassObj = childClass();
  childClassObj.methodParent1();
  childClassObj.methodParent2();
}