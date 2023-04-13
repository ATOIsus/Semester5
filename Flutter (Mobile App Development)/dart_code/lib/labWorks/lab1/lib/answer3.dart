// 3) Write a dart program to check whether a number is positive, negative, or zero.


void main(){

  int number = 456;

  checkNumber(number);

}

void checkNumber(int number){
  if(number > 0){
    print("$number is positive.");
  }else if(number < 0){
    print("$number is negative");
  }else{
    print("$number is zero.");
  }
}

