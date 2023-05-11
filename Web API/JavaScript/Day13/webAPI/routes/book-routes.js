const express = require('express')
const router = express.Router()

//Importing model.
const NewBook = require('../models/NewBook')

const bookController = require('../controllers/book-controller')
const reviewController = require('../controllers/review-controller')

const {verifyAdmin} = require('../middleware/auth')

router.route('/')

    //next is used for error handling.
    //next is defined in index.js i.e. a middleware.

    .get(bookController.getAllBook)

    .post(verifyAdmin, bookController.createBook)

    .put((req, res, next) => {
        res.status(405).json({ error: "PUT request is not allowed" })
    })

    .delete(verifyAdmin, bookController.deleteAllBook)



// ####################################################################################################################################
// Different URI. 

router.route('/:book_id')

    .get(bookController.getSingleBook)


    .post((req, res) => {
        res.status(405).json({ error: "POST request is not allowed" })
    })

    .put(bookController.upSingleBook)

    .delete(bookController.deleteSingleBook)


// ####################################################################################################################################
// Different URI. 


router.route('/:book_id/reviews')

    .get(reviewController.getAllReview)

    .post(reviewController.createReview)

    .put((req, res, next) => {
        res.status(405).json({ error: "PUT request is not allowed" })
    })

    .delete(reviewController.deleteAllReview)


    
// ####################################################################################################################################
// Different URI. 



router.route('/:book_id/reviews/:review_id')

    .get(reviewController.getReviewById)

    .post((req, res, next) => {
        res.status(405).json({ error: "POST request is not allowed" })
    })

    .put(reviewController.updateReviewById)
    
    .delete(reviewController.deleteReviewById)


module.exports = router