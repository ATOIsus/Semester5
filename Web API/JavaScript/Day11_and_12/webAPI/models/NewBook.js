const mongoose = require('mongoose')


const reviewSchema = new mongoose.Schema({
    text : {
        type : String,
        required : true,
        minLength : 10,
    },
    user : {
        type: mongoose.Schema.Types.ObjectId,
        required : true,
        ref: 'User'
    }
})
// red : nameOfModel < in module.exports = (nameOfModel, Schema) >
reviewSchema.set('toJSON', {
    transform : (document, returnDocument) => {
        returnDocument.id = document._id.toString()
        delete returnDocument._id
        delete returnDocument.__v
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


//Overriding 'toJSON' so that the returned document has type String instead of Object
bookSchema.set('toJSON', {
    transform: (document, returnDocument) =>{
        returnDocument.id = document.id.toString()
        delete returnDocument._id

    }
})


module.exports = mongoose.model('NewBook', bookSchema)