//5. Create a simple quiz application using oop that allows users to play and view their scores.

// ignore_for_file: prefer_final_fields

import 'dart:io';

class Quiz {
  int _score = 0;

  List<String> question = [
    "Full form of OOP",
    "What is Abstraction?",
    "What is Encapsulation?",
    "What is Inheritance?",
    "What is Polymorphism?"
  ];
  List<String> answer = [
    "Object Oriented Programming",
    "Implementation Hiding.",
    "Data Hiding",
    "Properties and methods from parent class to child class.",
    "One method having different behavior with different environment."
  ];

  List<String> option1 = [
    "Object Oriental Programming",
    "Object Oriented Programming",
    "Objective Oriented Programming",
    "Object Oriented Program"
  ];
  List<String> option2 = [
    "Hide data",
    "Hiding People",
    "Implementation Hiding.",
    "People hiding"
  ];
  List<String> option3 = [
    "Data Hiding",
    "Implementation Hiding",
    "404 Not Found",
    "Khai"
  ];
  List<String> option4 = [
    "Properties and methods from parent class to child class.",
    "Implementation Hiding",
    "404 Not Found",
    "Khai"
  ];
  List<String> option5 = [
    "Option1",
    "Option2",
    "Option4",
    "One method having different behavior with different environment."
  ];
}

void main() {
  var quizObj = Quiz();
  var score = quizObj._score;
  var question = quizObj.question;
  var answer = quizObj.answer;
  var option1 = quizObj.option1;
  var option2 = quizObj.option2;
  var option3 = quizObj.option3;
  var option4 = quizObj.option4;
  var option5 = quizObj.option5;

  List optionAll = [option1, option2, option3, option4, option5];

  for (int i = 0; i < question.length; i++) {
    print("\n${i + 1}) ${question[i]} ");

       
    print("\nOptions : ");


    for (var j = 0; j < question.length-1; j++) {
      print("${j + 1}) ${optionAll[i][j]}");
    }
 
    stdout.write("\nEnter option : ");
    int? answerUser = int.parse(stdin.readLineSync()!);

    if (optionAll[i][answerUser-1] == answer[i]) {
      score++;
      print("\nCorrect answer!");
    } else {
      print("\nIncorrect answer! The correct answer was ${answer[i]} but your choice was ${optionAll[i][answerUser]}");
    }

    print(" ");
  }


  print("\nYour score is : $score.");

}
