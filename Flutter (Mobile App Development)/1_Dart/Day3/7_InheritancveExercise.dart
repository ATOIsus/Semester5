class Faculty{
  String? fullName;
  String? address;
  int? age;

  Faculty({this.fullName, this.age, this.address});

  double yearlySalary() => 0;

  String getDetails() => "$fullName is $age years old living in $address";

}

class partTime extends Faculty{
  int? hourlySalary;
  int? hoursWorkedPerMonth;

  partTime({required String fullName, required int age, required String address, this.hourlySalary, this.hoursWorkedPerMonth}) : super( fullName : fullName, age : age, address : address);

  @override
  double yearlySalary() => hourlySalary! * hoursWorkedPerMonth! * 12;

  @override
  String getDetails() => "$fullName is $age years old living in $address is a part time employee with yearly salary ${yearlySalary}";
}

class fullTime extends Faculty{
  int? monthlySalary;

  fullTime({required String fullName, required int age, required String address, this.monthlySalary}) : super( fullName : fullName, age : age, address : address);

  @override
  double yearlySalary() => monthlySalary! * 12;

  @override
  String getDetails() => "$fullName is $age years old living in $address is a full time employee with yearly salary ${yearlySalary}";
}



void main(){
  var partTimer = partTime(fullName: "People 1", age: 12, address: "somewhere", hourlySalary : 500, hoursWorkedPerMonth : 20);

  var fullTimer = fullTime(fullName: "Old timer", age: 55, address: "His house", monthlySalary: 10000);

  print(partTimer.getDetails());
  print(fullTimer.getDetails());


}