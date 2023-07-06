import Counter from "./Counter"
import { act, logRoles, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'

describe('Counter testing', () => {

    test('should render correctly', () => {

        render(<Counter />)

        const h1Elem = screen.getByRole('heading', { level: 1 })
        expect(h1Elem).toBeInTheDocument()

        const btnElem = screen.getByRole('button', { name: "Increase" })
        expect(btnElem).toBeInTheDocument()

    })


    test('Should increase count with btn click', async () => {
        render(<Counter />)
        const increaseBtn = screen.getByRole('button', { name: "Increase" })

        await act(() => {
            userEvent.click(increaseBtn)
        })

        const h1Elem = screen.getByRole('heading', { level: 1 })
        expect(h1Elem).toHaveTextContent(1)
    })


    test('Should set initial value of count', async () => {
        const view = render(<Counter />)
        logRoles(view.container)


        const inputField = screen.getByRole('spinbutton')
        await act(() => {
            userEvent.type(inputField, "20")
        })

        const setBtn = screen.getByRole('button', { name: "Set" })
        await act(() => {
            userEvent.click(setBtn)

        })

        const h1Elem = screen.getByRole('heading', { level: 1 })
        expect(h1Elem).toHaveTextContent(20)

        const increaseBtn = screen.getByRole('button', { name: "Increase" })
        await act(() => {
            userEvent.click(increaseBtn)
        })

        expect(h1Elem).toHaveTextContent(21)
    })


    test('Should have proper order of focus while pressing Tab', () => {
        render(<Counter />)
        
        const increaseBtn = screen.getByRole('button', { name: "Increase" })
        const inputField = screen.getByRole('spinbutton')
        const setBtn = screen.getByRole('button', { name: "Set" })

        userEvent.tab()
        expect(increaseBtn).toHaveFocus()

        userEvent.tab()
        expect(inputField).toHaveFocus()


        userEvent.tab()
        expect(setBtn).toHaveFocus()

    })



})