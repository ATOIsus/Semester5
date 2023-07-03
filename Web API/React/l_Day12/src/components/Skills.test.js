import Skills from "./Skills"
import { render, screen, logRoles } from "@testing-library/react"



describe("Skills", () => {

    const skills = [{ id: 1, name: "Coding" }, { id: 2, name: "Plumbing" }, { id: 3, name: "Painting" }]

    test('renders correctly', () => {

        render(<Skills skills={skills} />)

        const h2Elem = screen.getByRole('heading', { level: 2 }) //getByRole is faster than other
        expect(h2Elem).toBeInTheDocument()

        const listElem = screen.getByRole('list')
        expect(listElem).toBeInTheDocument()

    })

    // test('render all list item', () => {
    //     render(<Skills skills={skills}/>)
    //     const itemsElem = screen.getAllByRole('listitem')
    //     expect(itemsElem).toHaveLength(3)
    // })

    // test('check first list item', () => {
    //     render(<Skills skills={skills}/>)
    //     const itemsElem = screen.getAllByRole('listitem')
    //     expect(itemsElem[0]).toHaveTextComponent('coding')
    // })


    test('Login button is rendered', () => {
        render(<Skills skills={skills} />)
        const btnElem = screen.getByRole('button', { name: "Log In" })
        expect(btnElem).toBeInTheDocument()
    })

    test('Log out is not rendered', () => {
        render(<Skills skills={skills} />)
        const btnElem = screen.queryByRole('button', { name: "Log Out" }) // queryBy : Almost same as find + for components that are not rendered. 
        expect(btnElem).not.toBeInTheDocument()

    })


    test('Log In button will render after 500 milliseconds', async () => {

        render(<Skills skills={skills} />)
        const btnElem = await screen.findByRole('button', { name: "Log Out" }, {timeout: 2000} )// findBy : For asynchronous functions.
        expect(btnElem).toBeInTheDocument()

        //If the async function is more than 1 second, findBy won't work.

    })

    test('renders correctly', () => {

        const view = render(<Skills skills={skills} />)
        logRoles(view.container)

        const h2Elem = screen.getByRole('heading', { level: 2 }) //getByRole is faster than other
        expect(h2Elem).toBeInTheDocument()

        const listElem = screen.getByRole('list')
        expect(listElem).toBeInTheDocument()

    })


})

