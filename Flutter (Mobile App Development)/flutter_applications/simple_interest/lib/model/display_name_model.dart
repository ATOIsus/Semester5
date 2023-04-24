class DisplayNameModel{
  var lstName = ["Name1", "Name2", "Name3"];

  String displayName(var index) => lstName[((index % lstName.length))];
}