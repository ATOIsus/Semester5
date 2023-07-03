import Greet from "./Greet"

import { render, screen } from "@testing-library/react"


describe('Greet', () => {

    test('renders correctly', () => {
        render(<Greet />)
        // const h1Elem  = screen.getByRole('heading', {level : 1} )
        //const h1Elem = screen.getAllByRole('heading', { name: "Hello" })

        //const h1Elem = screen.getByText("Hello")
        //const h1Elem = screen.getByText(/hello/i) // i is to ignore casing of word

        const h1Elem = screen.getByText("Hello", { exact: false })

        expect(h1Elem).toBeInTheDocument()

    })


    test('renders name prop', () => {

        render(<Greet name={"Smth"} />)
        const h1Elem = screen.getByText("Hello Smth")
        expect(h1Elem).toBeInTheDocument()

    })



})
