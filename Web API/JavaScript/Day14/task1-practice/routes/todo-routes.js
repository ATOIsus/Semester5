const express = require('express')
const router = express.Router()

//Importing model.
const Todo = require('../models/Todo')


router.route('/')
    .get(
        (req, res, next) => {
            Todo.find({ "user": req.user.id }).then((todo) => {
                if (!todo) return res.status(404).json({ error: "Todo not found." })
                res.json(todo)
            })
                .catch(next)
        }
    )
    .post(
        (req, res, next) => {
            Todo.create(req.body)
                .then((book) => res.status(201).json(book))
                .catch(next)
        }
    )
    .delete(

        (req, res, next) => {
            Todo.deleteMany({ "user": req.user.id })
                .then(reply => res.json(reply))
                .catch(next)
        }

    )




router.route('/:id')
    .get((req, res, next) => {
 
            Todo.findById(req.params.id)
                .then((todo) => {
                    //Custom error
                    if (!todo) {
                        res.status(404).json({ error: 'Todo not found' })
                        return;
                    }
                    if( todo.user == req.user.id){
                        res.json(todo)
                    }else{
                        res.status(404).json({ error: 'Todo not found' })
                    }
                    
                })
                .catch(next)
        }
    )


    .put((req, res, next) => {

            Todo.findByIdAndUpdate(
                req.params.id,
                { $set: req.body },
                { new: true }
            )
                .then((updated) => {
                    if( updated.user == req.user.id){
                        res.json(updated)
                    }else{
                        res.status(401).json({ error: 'You cannot update' })
                    }
                } )
                .catch(next)
        }
    )


    .delete((req, res, next) => {

        Todo.findById(req.params.id)
        .then((todo) => {
            //Custom error
            if (!todo) {
                res.status(404).json({ error: 'Todo not found' })
            }
            if( todo.user == req.user.id){
                deleteTodo()
            }else{
                res.status(401).json({ error: 'You cannot delete' })
            }
            
        })
        .catch(next)


        const todoDelete = Todo.findByIdAndDelete(req.params.id)
                .then((reply) => res.json(reply))
                .catch(next)
        }
    )



module.exports = router