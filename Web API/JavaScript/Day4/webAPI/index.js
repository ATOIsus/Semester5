// April 11, 2023.



// Everything is a middleware in express.
// Every request is responded by a middleware.


//Importing express.
const express = require('express')

//Creating an object.
const app = express()

// '/' is path.
app.get('/', (req, res) => {
    console.log(req)
    res.send("Hello World")
})

// port 80 is the default port for HTTP.
// 3000 is the port address.
app.listen(3000, () => {
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

app.get('/api/books', (req, res) => {
    //Converts JSON file to JSON string.
    res.json(books)
})



// Getting single book
app.get('/api/books/:bookId', (req, res) => {
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



// ###########################################################################################################################################################
// ###########################################################################################################################################################
// ###########################################################################################################################################################
// ###########################################################################################################################################################


// April 13, 2023.


//Decoder.  (middleware) // Should be below declaration of "app" and above routing
app.use(express.json())

app.post('/api/books', (req, res) => {

    //const id = books.map(b => b.id) //get list of bookId

    if (!req.body.title) {
        return res.status(400).json({ error: 'Title is missing!' })
    } else {

        const book = {
            id: books.length + 1,
            title: req.body.title,
            author: req.body.author || "N/A"
        }

        //Adding book to the list of books. (Only saved in the program not the actual file)
        books.push(book)

        res.status(201).json(book) // Status code 201 signifies that something is created.

    }

})

app.put('/api/books/:bookId', (req, res) => {

    
    if (!req.body.id) {
        return res.status(400).json({ error: 'Id is missing!' })
    } else if (!req.body.title) {
        return res.status(400).json({ error: 'Title is missing!' })
    } else if (!req.body.author) {
        return res.status(400).json({ error: 'Author is missing!' })
    }

    const bookId = Number(req.params.bookId) // req.params.bookId returns String datatype.

    const updatedBook = books.map((book) => {
        if(book.id === bookId){
            book.title = req.body.title,
            book.author = req.body.author
        }
        return book
    })

    res.json(updatedBook)

})


//Find to search elements only.
//Map: can be used to change the properties of the elements.


app.delete('/api/books/:bookId', (req,res) => {

    //delete books[req.params.bookId];   //This is for index.
    
    const updatedBookList = books.filter((b) => {
        if(b.id != req.params.bookId) return b
    })

    res.json(books)
})