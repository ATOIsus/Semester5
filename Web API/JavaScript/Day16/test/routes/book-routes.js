const express = require('express')
const router = express.Router()
const bookController = require('../controllers/book-controller')
const reviewController = require('../controllers/review-controller')
const { verifyAdmin } = require('../middlewares/auth')

router.route('/')
    .get(bookController.getAllBooks)
    .post(verifyAdmin, bookController.createBook)
    .put((req, res) => {
        res.status(405).json({ error: "PUT request is not allowed" })
    })
    .delete(verifyAdmin, bookController.deleteAllBooks)

router.route('/:book_id')
    .get(bookController.getBookById)
    .post((req, res) => {
        res.status(405).json({ error: 'POST request is not allowed' })
    })
    .put(bookController.updateBookById)
    .delete(bookController.deleteBookById)

router.route('/:book_id/reviews')
    .get(reviewController.getAllReviews)
    .post(reviewController.createReview)
    .put((req, res) => {
        res.status(405).json({ error: "PUT request is not allowed" })
    })
    .delete(reviewController.deleteAllReviews)

router.route('/:book_id/reviews/:review_id')
    .get(reviewController.getReviewById)
    .put(reviewController.updateReviewById)
    .delete(reviewController.deleteReviewById)
    .post((req, res) => {
        res.status(405).json({ error: 'POST request is not allowed' })
    })
module.exports = router
