const express = require('express')
const router = express.Router()

//Importing model.
const Book = require('../models/Books')



router.route('/')

    //Using model.


    //Using promises.

    //.get((req, res) => {
        // Book.find() 
        //             .then(books => res.json(books))
        //             .catch(err => console.log(err))

    //})



    //Using async.
    .get(async (req, res) => {
        try{
            const books = await Book.find()
            res.json(books)
        } catch(err){
            console.log(err)
        }

    })

    .post((req, res) => {
        if (!req.body.title) {
            return res.status(400).json({ error: 'Title is missing!' })
        } else {
    
            const book = {
                id: Book.length + 1,
                title: req.body.title,
                author: req.body.author || "N/A"
            }

           //Insert book data into nModel.
        
            res.status(201).json(book)
        }
    })

    .put((req, res) => {
        res.status(405).json({error: "PUT request is not allowed"})
    })

    .delete((req, res) => {
        res.status(405).json({error: "DELETE request is not allowed"})
    })



// ####################################################################################################################################
// Different URI. 

router.route('/:book_id')

    .get((req, res) => {
        const bookId = Number(req.params.bookId)
        const returnBook = books.find((b) => b.id === bookId)
    
        res.json(returnBook)
    })



    .post((req, res) => {
        res.status(405).json({error: "POST request is not allowed"})
    })




    .put((req, res) => {

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



    .delete((req,res) => {
    const updatedBookList = books.filter((b) => {
        if(b.id != req.params.bookId) return b
    })

    res.json(updatedBookList)
})

module.exports = router