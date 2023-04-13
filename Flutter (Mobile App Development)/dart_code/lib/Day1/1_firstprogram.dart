//Date: April 3, 2023


// ignore_for_file: file_names

//To use stdin method
import 'dart:io';

void main(){


  // Calculate Simple interest.

  print("Enter principle: ");
  double? pr = double.parse(stdin.readLineSync()!);

  stdout.write("Enter time     : ");
  double? tm = double.parse(stdin.readLineSync()!);

  stdout.write("Enter rate     : ");
  double? rate = double.parse(stdin.readLineSync()!);

  print("> Simple interest of principle $pr, time $tm and rate $rate is ${simpleInterest(principle: pr, rate : rate, time: tm)}");


//##################################################################################################################################
  // Calculate area of circle

  stdout.write("\nEnter radius of circle: ");
  double? radius = double.parse(stdin.readLineSync()!);

  print("> Area of circle with radius $radius is ${circleArea(radius)}");

//##################################################################################################################################

  // Convert Fahrenheit to Celsius.

  stdout.write("\nEnter temperature in fahrenheit: ");
  double? temp = double.parse(stdin.readLineSync()!);

  print("> $temp degrees fahrenheit is ${(temp-32) * 5 / 9}");


}


//Named parameters
double simpleInterest({double principle = 0, double time = 0, double rate = 0}){
  return (principle * time * rate) / 100;
}

//Optional parameter
double circleArea([double radius = 0]){
  return radius * 2.14;
}