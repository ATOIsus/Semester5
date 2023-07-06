import { render, screen } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { rest } from "msw"
import { server } from "../mocks/server"
import Notes from "./Notes"

describe('Notes testing.', () => {

    //test.only('Loads correctly', () => {

    test('Loads correctly', () => {

        render(<Notes />)

        const h1Elem = screen.getByRole('heading', { level: 1 })
        expect(h1Elem).toBeInTheDocument()
    })


    test('See if list is rendered.', async () => {
        render(<Notes/>)

        const listElem = screen.getByRole('list')
        expect(listElem).toBeInTheDocument()

        const listItemElem = await screen.findAllByRole('listitem')
        expect(listItemElem).toHaveLength(3)

    })

    test('should render error message', async () => {

        server.use(
            rest.get('https://jsonplaceholder.typicode.com/todos',
                (req, res, ctx) => {
                    return res(ctx.status(500))
                })
        )
        render(<Notes/>)

        const errorElem = await screen.findByText('Error fetching data.')

        expect(errorElem).toBeInTheDocument()
        
    })

    test('Should call the delete function', async () => {
        const mockFun = jest.fn()
        render(<Notes handleDelete={mockFun}/>)

        const deleteBtn = await screen.findAllByRole('button', {
            name : 'Delete'

        })

        userEvent.click(deleteBtn[0])

        expect(mockFun).toHaveBeenCalledTimes(1)

    })



})