import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

//  Small letter: File name //
@freezed
class Person with _$Person {
  const factory Person(
      {required String firstName,
      required String lastName,
      required int age}) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}

void main(List<String> args) {
  final obj = Person(firstName: "firstName", lastName: 'lastName', age: 213);
  final obj2 = Person(firstName: "smth", lastName: 'thing', age: 123);
  final obj3 = Person(firstName: "smth1", lastName: 'thing1', age: 1);
  final obj4 = Person(firstName: "smth2", lastName: 'thing2', age: 2);
  final obj5 = Person(firstName: "smth3", lastName: 'thing3', age: 3);

  List<Person> lstPerson = [obj, obj2, obj3, obj4, obj5];

  for(Person p in lstPerson){
    print("Name ${p.firstName} ${p.lastName} is of age ${p.age}");
  }
}




// Every time you change the file, you need to run:
// dart pub run build_runner build --delete-conflicting-outputs
