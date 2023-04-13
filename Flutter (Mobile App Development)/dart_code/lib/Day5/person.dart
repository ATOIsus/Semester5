import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';
//  Small letter: File name //
@freezed
class Person with _$Person{
     const factory Person({
      required String firstName,
      required String lastName,
      required int age
    }) = _Person;

    factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}


void main(List<String> args) {
  Person obj = Person(firstName: "firstName", lastName: 'lastName', age: 213);
  print(obj);

  Person obj2 = Person(firstName: "smth", lastName: 'thing', age: 123);
  print(obj2);
  
  List lstPerson = [obj, obj2];
}



//dart pub run build_runner build --delete-conflicting-outputs
