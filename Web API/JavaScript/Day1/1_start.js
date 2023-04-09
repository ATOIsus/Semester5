//April 6, 20023.



//console.log(a) // will cause error.
//console.log(x)
//console.log(y) // will cause error.
//console.log(z) // will cause error.

//Default.
a = 0

// Declaring and initializing variable "x" with the value 1.
// It is initialized automatically with undefined, but later can cause problems.
// So, the variable can be accessed before initialization which could be a problem.
var x = 1


// So, either let or const should be used.

//console.log(y)   // y is not initialized automatically.
let  y = 3

//Can change if there is Object, but not primitive data types.
const z = 9


console.log(a)
console.log(x)
console.log(y)
console.log(z)




// Function


// Before the program runs (interpretation).
//      Whole code is reviewed and memory locations is allocated for function and var.
//So, the function can be called before its definition in code.
console.log(add(4,6))


//Function declaration.

function add(x , y){
    return x  + y;
}

// Functions are treated as first class citizens.
//     Treated as variables.
//     So, functions can be passed as parameters and a function can return type of another function.

console.log("Type is "  + typeof (add))

console.log("Addition is of 3 and 5 is : "  + add(3,5))
console.log("Concatenation is done if string is passed : "  + add(3,"5"))


// Function expressions.

// Anonymous function: Functions without name.
//console.log(variableSmth(55,23))          //will get error because variable "variableSmth" is not initialized.


// Function expressions are used because there is limited (local) usage preventing unintended access.
const variableSmth = function(x,y){
    return x - y
}

console.log(variableSmth(55,23))


//Arrow Functions:
const multiply = (x,y) => {
    return x * y
}

console.log(multiply(4,5))

//Shortcut lambda function
const divide = (x,y) => x/y
console.log(divide(5,2))



//In javascript: Before running the 
    // var : Assigns a memory block and initializes a value.



// To run a program: in terminal
//                      node 1_start.js


//Data types:

//num : int, float, double
//String
//Boolean
//Object, Array






