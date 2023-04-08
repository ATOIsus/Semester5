// 4) Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.

void main() {
  List<String> lst = [];

  lst.add("Sunday");
  lst.add("Monday");
  lst.add("Tuesday");
  lst.add("Wednesday");
  lst.add("Thursday");
  lst.add("Friday");
  lst.add("Saturday");

  printList(lst);
}

void printList(List lst) {
  for (var i = 0; i < lst.length; i++) {
    print(lst[i]);
  }
}
