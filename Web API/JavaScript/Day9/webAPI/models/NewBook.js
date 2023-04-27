const mongoose = require('mongoose')


const reviewSchema = new mongoose.Schema({
    text : {
        type : String,
        required : true,
        minLength : 10,
    }
})

const bookSchema = new mongoose.Schema({

    title: {
        type: String,
        
    },

    author: {
        type: String,
        default: "Anonymous",
    },
    
    price: {
        type: String,
    },

    reviews: [reviewSchema], // List of reviews. Used because we don't have to join or look up

}, { timestamps: true })



module.exports = mongoose.model('NewBook', bookSchema)