class Student {
  String? fName;
  String? lName;
  String? address;

  Student({required this.fName, required this.lName, required this.address});

  @override
  String toString() => "$fName $lName lives in $address";

  Student copyWith({String? fName, String? lName, String? address}) {
    return Student(
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        address: address ?? this.address);
  }
}

void main() {
  Student obj1 = Student(fName: "Name1", lName: "Last1", address: "Somewhere");
  Student obj2 = Student(fName: "Name1", lName: "Last1", address: "Somewhere");

  print(obj1);
  print(obj2);

  print(obj1 == obj2);

  // Using copyWith.

  Student copyStudent1 = obj1.copyWith();
  Student copyStudent2 = obj1.copyWith(fName: "Hello");
  Student copyStudent3 = obj1.copyWith(address: "Khai");

  print(copyStudent1);
    print(copyStudent2);
  print(copyStudent3);

}




// aLT sHIFT Down Key
