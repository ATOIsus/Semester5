// April 5, 2023





class namedConstructor{

  // The variables (fields/ properties) can be null.
  int? a;
  int? b;
  int? c;

  // late int a;    // can be used to say to the compiler that a will be later but surely initialised.  


  // "required" is used to get variables "a" and "b" compulsory.
  namedConstructor({required this.a, required this.b, this.c});

  // Will get an error for:
  //  int add() => a + b + c;

  // So, use.     "!" tells the compiler that "a", "b" and "c" will be initialized i.e. values will be given.
  int add() => a! + b! + c!;

  // But variable "c" can be null, because it is not required in the named constructor. 

  //So if "c" is null, then "c" = 0;

  int multiply() => a! + b! + (c ?? 1);


  double simpleInterest() => (a! * b! * c!) / 100;


  


}