class TryCatchExample{

  void checkError(){
    try{
      String nameSomething = "smth";
      print("Printing impossible ${nameSomething[8]}");
    }catch(e, stackTrace){
      print("Error $e at trace $stackTrace");
    }
    print("executed");
  }


  void main(){
    TryCatchExample obj = TryCatchExample();
    obj.checkError();
  } 


}