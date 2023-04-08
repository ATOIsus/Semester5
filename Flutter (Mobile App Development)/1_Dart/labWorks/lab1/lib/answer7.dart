// 7) Write a dart program to generate multiplication tables of 1-9.

void main(){
  table1to9();
}

void table1to9(){

  for (var i = 1; i < 10; i++) {
    for (var j = 1; j <= 10; j++) {
      print(i * j);
    }
    print(" ");
  }
}

