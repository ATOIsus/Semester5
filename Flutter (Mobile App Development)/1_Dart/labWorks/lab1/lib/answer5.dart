// 5) Write a dart program to calculate the sum of natural numbers.

void main(){

  int number = 7;

  print("Sum of natural number up to $number is ${sumNaturalNum(number)}.");

}

int sumNaturalNum(int number) => (number * (number + 1) / 2).floor();
