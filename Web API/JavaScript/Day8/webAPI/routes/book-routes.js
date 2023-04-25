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
        res.status(405).json({error: "PUT request is not allowed"})
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
                    if(!book){
                        res.status(404).json({error : 'Book bot found'})
                    }

                    res.json(book)
                })
                .catch(next)
    })


    .post((req, res) => {
        res.status(405).json({error: "POST request is not allowed"})
    })

    .put((req, res, next) => {

      NewBook.findByIdAndUpdate(
            req.params.book_id,
            { set: req.body },
            { new : true }
            ) 
            .then((updated) => res.json(updated))
            .catch(next)
    })

    .delete((req,res,next) => {
   
        NewBook.findByIdAndDelete(req.params.book_id)
            .then((reply) => res.json(reply)) //res.status(204).end()
            .catch(next)
})

module.exports = router