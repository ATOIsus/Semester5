require('dotenv').config()
const express = require('express')
const mongoose = require('mongoose')
const books_routes = require('./routes/book-routes')
const user_routes = require('./routes/user-routes')
const { verifyUser } = require('./middlewares/auth')
const upload = require('./middlewares/upload')

const MONGODB_URI = process.env.NODE_ENV === 'test'
    ? process.env.TEST_DB_URI
    : process.env.DB_URI

mongoose.connect(MONGODB_URI)
    .then(() => {
        console.log(`connected to ${MONGODB_URI}`)
    })
    .catch((err) => console.log(err))

const app = express()

app.use(express.json())
app.use(express.static('public'))

app.get('/', (req, res) => {
    res.send("Hello Node")
})

app.use('/users', user_routes)
// app.use(verifyUser)
app.use('/books', verifyUser, books_routes)

app.post('/upload', upload.single('photo'), (req, res, next) => {
    res.json(req.file)
})
// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err)
    if (err.name === 'ValidationError') res.status(400)
    else if (err.name === 'CastError') res.status(400)
    res.json({ error: err.message })
})

// Unknown Path
app.use((req, res) => {
    res.status(404).json({ error: "Path Not Found" })
})

module.exports = app
