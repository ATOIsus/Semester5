// 30 April, 2023

//Separating function from routing.

const NewBook = require('../models/NewBook')


const getAllBook = (req, res, next) => {
    NewBook.find()
        .then(books => res.json(books))
        .catch(next)
}

const createBook = (req, res, next) => {
    NewBook.create(req.body)
        .then((book) => res.status(201).json(book))
        .catch(next)
}

const deleteAllBook = (req, res, next) => {
    NewBook.deleteMany()
        .then(reply => res.json(reply))
        .catch(next)
}


// ###################################################################################################################### //
// For /books/:book_id

const getSingleBook = (req, res, next) => {
    NewBook.findById(req.params.book_id)
        .then((book) => {

            //Custom error
            if (!book) {
                res.status(404).json({ error: 'Book bot found' })
            }

            res.json(book)
        })
        .catch(next)
}

//Don't use updateSingleBook it is a 
const upSingleBook = (req, res, next) => {

        NewBook.findById(req.params.book_id)
        .then(book => {
            if (!book) return res.status(404).json({ error: "Book not found." })
            book.reviews = book.reviews.map((r) => {
                if (r.id === req.params.review_id) { // _id is of Object type and review_id is of String type, So, === can't be used. Later is id is of type string.
                    r.text = req.body.text
                }
                return r
            })
            book.save()
                .then(book => {
                    res.json(book.reviews.id(req.params.review_id))
                })
                .catch(next)
        })
        .catch(next)
}

const deleteSingleBook = (req, res, next) => {

    NewBook.findByIdAndDelete(req.params.book_id)
        .then((reply) => res.json(reply)) //res.status(204).end()
        .catch(next)
}


module.exports = {
    getAllBook,
    createBook,
    deleteAllBook,

    getSingleBook,
    upSingleBook,
    deleteSingleBook,
}