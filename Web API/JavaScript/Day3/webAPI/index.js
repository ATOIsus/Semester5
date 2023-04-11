// April 11, 2023.



// Everything is a middleware in express.
// Every request is responded by a middleware.


//Importing express.
const express = require('express')

//Creating an object.
const app = express()

// '/' is path.
app.get('/', (req,res) => {
    console.log(req)
    res.send("Hello World")
})

// port 80 is the default port for HTTP.
// 3000 is the port address.
app.listen(3000,() => {
    console.log('Server is running at port 3000')
})


// node index.js //to run the express server.
// http://localhost:3000/  in web browser to make request to the server.
// Ctrl + C to stop the server.

// #######################   You need to restart server after making changes. ###########################






// HTTP request types:
//   a) GET: Ask for resources from user to server. 
//   b) POST: Send date from user to server, and create something in server.
//   c) PUT: To update something. (mostly all fields are updated)
//   d) DELETE: To delete something.
//   e) PATCH: To update minor/few attributes.


// GET request: Every data is written in the URL so there is a security risk.
//              Size is constrained.

// ################### Install Thunder Client to make different HTTP requests.###################



// Importing books (Better if at top of the program)
let books = require('./data/books')

app.get('/api/books', (req, res) =>{
    //Converts JSON file to JSON string.
    res.json(books)
})



// Getting single book
app.get('/api/books/:bookId', (req,res) =>{
    // Returns data from the user URL.
    //res.json(req.params)

    // Returns the book id.
    //res.json(req.params.bookId)

    // Returning a single book matching the ID.
    //const returnBook = books.find((b) => b.id == req.params.bookId)
    const bookId = Number(req.params.bookId)
    const returnBook = books.find((b) => b.id === bookId)

    // == can change the data type.
    // === looks for same value and data type.

    res.json(returnBook)

})

// ################################ Only one response can be returned at a time! ################################

// npm install express
// npm install nodemon --save-dev


// npm run dev //To execute custom scripts from terminal.