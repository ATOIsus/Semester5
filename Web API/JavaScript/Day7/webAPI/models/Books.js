const mongoose = require('mongoose')


const bookSchema = new mongoose.Schema({

    title: {
        type: String,
        required: true,

    },


    author: {
        type: String,
        default: "Anonymous"
    },

}, { timestamps: true })



module.exports = mongoose.model('Book', bookSchema)