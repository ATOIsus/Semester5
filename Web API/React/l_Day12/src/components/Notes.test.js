import { render, screen } from "@testing-library/react"
import Notes from "./Notes"

describe('Notes testing.', () => {

    test('Loads correctly', () => {

        render(<Notes />)

        const h1Elem = screen.getByRole('heading', { level: 1 })
        expect(h1Elem).toBeInTheDocument()
    })


    test('See if list is rendered from real API.', async () => {
        render(<Notes />)

        const listElem = screen.getByRole('list')
        expect(listElem).toBeInTheDocument()

         const listItemElem = await screen.findAllByRole('listitem')
        expect(listItemElem).toHaveLength(200)

    })


})