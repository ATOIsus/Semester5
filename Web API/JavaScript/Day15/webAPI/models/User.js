const mongoose = require('mongoose')

const userSchema = new mongoose.Schema({
    username :{
        type: String,
        required : true,
        minLength : 5,
        unique : true
    },
    password : {
        type : String,
        required : true
    },
    fullName : {
        type : String,
        required: true
    },
    email : {
        type : String,
        required : true,
    },
    role: {
        type: String,
        enum: ['user', 'admin'],
        default: 'user',
    
    }
})

// set toJSON method to not to return hashed password

userSchema.set('toJSON', {
    transform: (document, returnedDocument) => {
        returnedDocument.id = document._id.toString()
        delete returnedDocument._id
        delete returnedDocument.password
        delete returnedDocument.__v
    }
})


module.exports = new mongoose.model('User', userSchema)