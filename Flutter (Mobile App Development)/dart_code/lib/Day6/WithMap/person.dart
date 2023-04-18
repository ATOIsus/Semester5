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




// Every time you change the file, you need to run:
// dart pub run build_runner build --delete-conflicting-outputs
