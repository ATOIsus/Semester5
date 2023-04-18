
//April 18, 2023

//USing .env file.
require('dotenv').config()           
const portRoute = process.env.PORT

//Importing routes.
const books_routes = require('./routes/book-routes')





const mongoose = require("mongoose")

mongoose.connect('mongodb://127.0.0.1:27017/demo')   // mongodb://localhost:27017/demo will not work.
        .then(() => console.log("Connected to mongodb."))
        .catch((err) => console.log(err))


const express = require('express')


//Creating an object.
const app = express()


app.listen(portRoute, () =>{
    console.log(`server is running in ${portRoute}`)   //  Formatted string: `` not ''
 })


// Using routes from another file

app.use('/api/books_routes', books_routes)



