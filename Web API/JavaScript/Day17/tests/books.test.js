const supertest = require('supertest')
const app = require('../app')
const Book = require('../models/Book')
const { default: mongoose } = require('mongoose')

const api = supertest(app)

let token = ''

beforeAll(async () => {
    await Book.deleteMany()
    await Book.create({
        title: "War and Peace",
        author: "Leo Tolstoy"
    })

    await api.post('/users/register')
        .send({
            username: "testUser2",
            password: "test123",
            fullname: "Test User",
            email: "test2@gmail.com"
        })

    const res = await api.post('/users/login')
        .send({
            username: "testUser2",
            password: "test123"
        })
    token = res.body.token
})

afterAll(async () => await mongoose.connection.close())

test('loggedin user can get list of books', async () => {
    const res = await api.get('/books')
        .set('authorization', `bearer ${token}`)
        .expect(200)

    expect(res.body[0].title).toMatch(/War/)
})