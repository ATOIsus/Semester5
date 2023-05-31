import axios from "axios"
import { useEffect, useState } from "react"


export default function PhoneBook() {


    const [updateId, setUpdateId] = useState(' ')

    const [name, setName] = useState(' ')
    const [phone, setPhone] = useState(' ')
    const [search, setSearch] = useState(' ')
    const [phoneBook, setPhoneBook] = useState([])


    const baseUrl = 'http://localhost:4000/book'

    useEffect(() => {
        axios.get(baseUrl)
            .then(response => {
                console.log(response)
                setPhoneBook(response.data)
            })

    }, [])

    const handleChangeName = (event) => {
        setName(event.target.value)
    }

    const handleChangePhone = (event) => {
        setPhone(event.target.value)
    }

    const handleChangeSearch = (event) => {
        setSearch(event.target.value)
    }


    const handleAdd = (event) => {
        event.preventDefault()
        const newPhoneBook = {
            id: phoneBook.length + 100,
            name: name,
            phone: phone
        }


        if (updateId != ' ') {

            axios.put(`${baseUrl}/${updateId}`, { name: name, phone: phone }).then(response => {
                console.log(response.data)

                const updatedBook = phoneBook.map(book => {
                    if (book.id == updateId) {
                        book.name = name;
                        book.phone = phone;
                    }
                    return book;
                })

                setPhoneBook(updatedBook)
            })

            setUpdateId(' ')
        } else {

            axios.post(baseUrl, newPhoneBook).then(response => {
                console.log(response.data)
                setPhoneBook(phoneBook.concat(newPhoneBook))
            })

        }
        setName('')
        setPhone('')


    }

    const handleDelete = (id) => {
        if (window.confirm(`Are you sure to phone book with id : ${id}`)) {
            axios.delete(`${baseUrl}/${id}`).then((response) => {
                console.log(response)
                setPhoneBook(phoneBook.filter((el) => { return el.id != id; }))
            }
            )
        }
    }


    const handleEdit = (id) => {

        phoneBook.map((book) => {
            if (book.id == id) {
                setName(book.name)
                setPhone(book.phone)
                setUpdateId(book.id)
            }
        })
    }


    const handleSearch = () => {
        let found = false
        let foundBook

        phoneBook.map((book) => {
            console.log(search)
            console.log(`${book.id} ${book.name} ${book.phone}`)
            if (book.id == search || book.name == search || book.phone == search) {
                console.log("Payo hai!")
                found = true
                foundBook = book
            } else {
                console.log("Khai payena ho!")

            }
        })

        if (found) {
            alert(`${foundBook.name} found!`)
        } else {
            alert(`${search}  not found!`)
        }

        setSearch('')

    }


    return (
        <div>
            <h2> List of contacts </h2>

            <input
                type="search"
                placeholder="Search here"
                onChange={handleChangeSearch}
                value={search} />
            <button onClick={(search) => handleSearch(search)}>Search</button>
            <br />
            <br />
            <br />
            <br />

            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Action</th>
                    </tr>

                </thead>
                <tbody>
                    {phoneBook.map(c =>
                        <tr key={c.id}>
                            <td> {c.name}  </td>
                            <td> {c.phone} </td>
                            <td> <button onClick={(id) => handleEdit(c.id)}> Edit </button>
                                <button onClick={(id) => handleDelete(c.id)}> Delete </button>   </td>
                        </tr>
                    )
                    }
                </tbody>
            </table>

            <br />
            <br />
            <br />
            <br />


            <form>
                {'Name :  '} <input onChange={handleChangeName} type="text" value={name} />
                {'Phone :  '}  <input onChange={handleChangePhone} type="text" value={phone} />
                <button onClick={handleAdd}>Add Contact</button>
            </form>


        </div>
    )
}
