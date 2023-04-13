


class Smth{
  static final Smth _instance = Smth._internal();

  //Private Constructor
  Smth._internal();

  factory Smth(){
    return _instance;
  }


  int add(int first, int second) => first + second;
  int sub(int first, int second) => first - second;

}


void main(){
  Smth smthObj = Smth();
  print(smthObj.add(2, 4));

  Smth smth2 = Smth();
  print(smthObj.sub(3, 5));


  print(smthObj == smth2);
  
}




// Singleton class is used because to : 
//      a) Use only one object.
//      b) Reuse same object.