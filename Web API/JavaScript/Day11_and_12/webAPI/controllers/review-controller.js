
const NewBook = require('../models/NewBook')




// For /books/:book_id/reviews
const createReview = (req, res, next) => {

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
}

const getAllReview = (req, res, next) => {
    NewBook.findById(req.params.book_id)
        .then((book) => {
            if (!book) return res.status(404).json({ error: "Book not found." })
            res.json(book.reviews)
        })
        .catch(next)
}

const deleteAllReview = (req, res, next) => {

    NewBook.findById(req.params.book_id)
        .then((book) => {
            if (!book) return res.status(404).json({ error: "Book not found." })
            book.reviews = []
            book.save()
                .then((book) => res.status(204).end())
                .catch(next)
        })
        .catch(next)
}


// ###################################################################################################################### //
// For /books/:book_id/reviews/:review_id



const getReviewById = (req, res, next) => {

    NewBook.findById(req.params.book_id)
        .then(book => {
            if (!book) return res.status(404).json({ error: "Book not found." })
            book.reviews = book.reviews.map((r) => {
                if (r.id === req.params.review_id) { // _id is of Object type and review_id is of String type, So, === can't be used.
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

const updateReviewById = (req, res, next) => {

    NewBook.findById(req.params.book_id)
        .then(book => {
            if (!book) return res.status(404).json({ error: "Book not found." })
            book.reviews = book.reviews.map((r) => {
                if (r.id === req.params.review_id) { // _id is of Object type and review_id is of String type, So, === can't be used.
                    if(r.user == req.params.review_id){
                        r.text = req.body.text
                    }
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

const deleteReviewById = (req, res, next) => {

    NewBook.findById(req.params.book_id)
        .then(book => {
            if (!book) return res.status(404).json({ error: "Book not found." })
            book.reviews = book.reviews.filter((r) => {
                  return (r.id !== req.params.review_id && r.user !== req.user.id) 
            })
            book.save()
                .then(book => res.status(204).end())
                .catch(next)
        })
        .catch(next)
}



module.exports = {
    createReview,
    getAllReview,
    deleteAllReview,

    getReviewById,
    updateReviewById,
    deleteReviewById,
}