
//April 16, 2023

//USing .env file.
require('dotenv').config()           
const portRoute = process.env.PORT

//Importing routes.
const books_routes = require('./routes/book-routes')



const express = require('express')

//Creating an object.
const app = express()


app.listen(portRoute, () =>{
    console.log(`server is running in ${portRoute}`)   //  Formatted string: `` not ''
 })


// Using routes from another file

app.use('/api/books_routes', books_routes)


