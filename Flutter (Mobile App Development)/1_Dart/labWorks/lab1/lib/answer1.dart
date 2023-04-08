// 1) Write a dart program to check if the number is odd or even.

void main() {
  int number = 23;

  if (checkEven(number)) {
    print("$number is even.");
  } else {
    print("$number is odd.");
  }
}

bool checkEven(int number) => (number % 2 == 0);
