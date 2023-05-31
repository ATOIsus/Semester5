class User{
  int? id ;
  String? name;
  int? age;


  User({this.id, this.name, this. age});

  @override
  String toString() {
    return '$id, $name, $age';
  }
}