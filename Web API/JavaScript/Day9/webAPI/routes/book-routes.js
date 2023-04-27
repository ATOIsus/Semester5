const express = require('express')
const router = express.Router()

//Importing model.
const NewBook = require('../models/NewBook')



router.route('/')

    //next is used for error handling.
    //next is defined in index.js i.e. a middleware.

    .get((req, res, next) => {
        NewBook.find()
            .then(books => res.json(books))
            .catch(next)
    })

    .post((req, res, next) => {
        NewBook.create(req.body)
            .then((book) => res.status(201).json(book))
            .catch(next)
    })

    .put((req, res, next) => {
        res.status(405).json({ error: "PUT request is not allowed" })
    })

    .delete((req, res, next) => {
        NewBook.deleteMany()
            .then(reply => res.json(reply))
            .catch(next)
    })



// ####################################################################################################################################
// Different URI. 

router.route('/:book_id')

    .get((req, res, next) => {
        NewBook.findById(req.params.book_id)
            .then((book) => {

                //Custom error
                if (!book) {
                    res.status(404).json({ error: 'Book bot found' })
                }

                res.json(book)
            })
            .catch(next)
    })


    .post((req, res) => {
        res.status(405).json({ error: "POST request is not allowed" })
    })

    .put((req, res, next) => {

        NewBook.findByIdAndUpdate(
            req.params.book_id,
            { set: req.body },
            { new: true }
        )
            .then((updated) => res.json(updated))
            .catch(next)
    })

    .delete((req, res, next) => {

        NewBook.findByIdAndDelete(req.params.book_id)
            .then((reply) => res.json(reply)) //res.status(204).end()
            .catch(next)
    })




router.route('/:book_id/reviews')

    .get((req, res, next) => {
        NewBook.findById(req.params.book_id)
            .then((book) => {
                if (!book) return res.status(404).json({ error: "Book not found." })
                res.json(book.reviews)
            })
            .catch(next)
    })

    .post((req, res, next) => {

        NewBook.findById(req.params.book_id)
            .then((book => {
                if (!book) return res.status(404).json({ error: "Book not found." })
                const review = {
                    text: req.body.text
                }
                book.reviews.push(review)
                book.save()
                    .then((book) => res.status(201).json(book.reviews[book.reviews.length - 1]))
                    .catch(next)
            })
            )
            .catch(next)
    })


    .put((req, res, next) => {
        res.status(405).json({ error: "PUT request is not allowed" })
    })


    .delete((req, res, next) => {

        NewBook.findById(req.params.book_id)
            .then((book) => {
                if (!book) return res.status(404).json({ error: "Book not found." })
                book.reviews = []
                book.save()
                    .then((book) => res.status(204).end())
                    .catch(next)
            })
            .catch(next)
    })





router.route('/:book_id/reviews/:review_id')

    .get((req, res, next) => {
        NewBook.findById(req.params.book_id)
            .then((book) => {
                if (!book) return res.status(404).json({ error: "Book not found." })

                const review = book.reviews.id(req.params.review_id)

                if (!review) return res.status(404).json({ error: "Review not found." })
                res.json(review)
            })
            .catch(next)
    })


    .post((req, res, next) => {
        res.status(405).json({ error: "POST request is not allowed" })
    })



    .put((req, res, next) => {

        NewBook.findById(req.params.book_id)
            .then(book => {
                if (!book) return res.status(404).json({ error: "Book not found." })
                book.reviews = book.reviews.map((r) => {
                    if (r._id == req.params.review_id) { // _id is of Object type and review_id is of String type, So, === can't be used.
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
    })


    // "book.save()" is used and not "review.save()" because book(NewBook) is the model and review is an embedded document.

    
    .delete((req, res, next) => {

        NewBook.findById(req.params.book_id)
            .then(book => {
                if (!book) return res.status(404).json({ error: "Book not found." })
                book.reviews = book.reviews.filter((r) => {
                    return r._id != req.params.review_id
                })
                book.save()
                    .then(book => res.status(204).end())
                    .catch(next)
            })
            .catch(next)
    })











module.exports = router