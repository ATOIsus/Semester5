class Arith{
  int? first;
  int? second;

  Arith({this.first, this.second});

  int add(){
    return first! + second!;
  }

    int sub(){
    return first! - second!;
  }


    double div(){
    return first! / second!;
  }

    int mul(){
    return first! * second!;
  }
}