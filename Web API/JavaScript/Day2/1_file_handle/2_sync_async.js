// April 9, 2023.


//Import library.
const fs = require('fs')

// buffer is returned by readFileSync method.


//  Synchronous 

//const data = fs.readFileSync('./smth.txt')
//console.log(data.toString())
//console.log('end')


// ####################################################################################################

// Asynchronous 

// fs.readFile('./smth.txt', (err, data) => {
//     if (err) throw new err

//     console.log(data.toString())

//     fs.writeFile('./output.txt', data, (err) => {
//         if (err) throw new err
//     })
// })

// console.log('end')


// ####################################################################################################


//Callback hell: nested callback functions making it hard to understand and manage the code.
//  Mitigation:
//              1) promises:
//                          .then() //Success
//                          .catch() //Failure
//              2) Async-await: Needs to be inside try catch.
//                              It should be inside async function.


//############### Promises library is needed to run promises and async-await  ###############//

// Promises.

//if fs.readFile is successful; .then() is executed, else .catch() is executed. 
//fs.readFile('./smth.txt').then().catch() // In a single line with empty promises.

// fs.readFile('./smth.txt')
//     .then((data) => console.log(data.toString()))
//     .catch((err) => console.log(err))

// ####################################################################################################

 //Async-await

//  async function fun(){
//     try{
//         const data = await fs.readFile('./smth.txt')
//     } catch(err){
//         console.log(err)
//     }
//  }
