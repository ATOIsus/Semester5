import { rest } from 'msw'

export const handlers = [
    rest.get('https://jsonplaceholder.typicode.com/todos', (req, res, ctx) => {
        return res(
            ctx.status(200),
            ctx.json([
                { id: 1, title: "asd" },
                { id: 2, title: "dsa" },
                { id: 3, title: "amd" }
            ]))

    })

]