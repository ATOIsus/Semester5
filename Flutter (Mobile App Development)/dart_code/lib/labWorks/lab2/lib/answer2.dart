// 2) Create a set of fruits and print all fruits using a loop.

void main(){

  Set fruits = <String>{"Apple","Banana", "Citrus Food","Orange"};  
  fruits.add("Watermelon");

  printSet(fruits);

}

void printSet(Set stt){
  int i = 0;
  while(i < stt.length){
    print(stt.elementAt(i));
    i++;
  }
}