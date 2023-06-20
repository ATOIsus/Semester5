
const books_routes = require('./routes/book-routes')
const users_routes = require('./routes/user-routes')
const { verifyUser } = require('./middleware/auth')
const upload = require("./middleware/upload")


const express = require('express')


const app = express()
app.use(express.json())
app.use(express.static('public'))

app.get('/', (req, res) => {
    console.log(req)
    res.send("Hello World")
})

app.use('/books', verifyUser, books_routes)
app.use('/users', users_routes)
app.post('/upload', upload.single('photo'), (req, res, next) => {
    res.json(req.file)
})


module.exports = { app }