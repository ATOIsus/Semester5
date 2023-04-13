// 2) Write a dart program to check whether a character is a vowel or consonant.

void main() {

  String character = "u";

  if(checkVowel(character)){
    print("'$character' is a vowel.");
  }else{
    print("'$character' is a consonant.");
  }

}

bool checkVowel(String character) {
  List lstVowels = ['a', 'e', 'i', 'o', 'u'];

  for (String i in lstVowels) {
    if (character == i) {
      return true;
    }
  }

  return false;
}
