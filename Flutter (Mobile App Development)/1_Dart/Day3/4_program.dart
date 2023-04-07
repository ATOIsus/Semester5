// April 5, 2023.


class newClass{


  int a;
  int b;


  //Constructor overloading.

  newClass(this.a, this.b);
  newClass.withoutFirst(this.b) : a = 0;
  newClass.withoutSecond(this.a) : b = 0;



  int add() => a + b;

}


void main(){
  var newObj = newClass.withoutFirst(3);
  int c = newObj.add();

  print(c);
}