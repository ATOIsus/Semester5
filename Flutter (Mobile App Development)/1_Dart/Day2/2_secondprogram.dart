//Date: April 4,2023

import 'dart:io';

void main(){

  add();

  makeArray();

  makeMap();

}


void add(){

  //Nullable variable
  int? first;
  int? second;

  first = 4;
  second = 7;

  int result = first + second;

  print("$first + $second = $result");

}


void makeArray(){
  var arr = [1,2,3,4,5];

  arr.add(8);

  for(int i = 0; i < arr.length; i++){
    print(arr[i]);
  }

  for(int i in arr){
    if(i % 2 == 0){
      print(i);
    }
  }
}

void makeMap(){
  Map englishToNeplai = {
    "Hello": "Namaste",
    "Come" : "Aunu hos",
    "Go" : "Janu hos"
  };

  englishToNeplai["Bye"] = "Tata";

  print(englishToNeplai);
  print(englishToNeplai.keys);
  print(englishToNeplai.values);

  
  print("Enter English word: ");
  String? searchValue = stdin.readLineSync()!;

  print("English '$searchValue' is in ${englishToNeplai[searchValue]} ");


}

/*
  /variable "a" can be null
  int? a;

  /a! means that variable "a" will never be null. i.e. some value is passed into the variable "a"
  add(a!, b);

  /If a is null, then a = 0;
  int b = 5 * (a ?? 0);

*/