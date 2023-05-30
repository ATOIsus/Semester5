import { useState } from "react"

export default function Notes(props) {


    const [updateId, setUpdateId] = useState(' ')

    const [name, setName] = useState(' ')
    const [phone, setPhone] = useState(' ')
    const [search, setSearch] = useState(' ')
    const [phoneBook, setPhoneBook] = useState(props.contacts)

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
            id: phoneBook.length + 1,
            name: name,
            phone: phone
        }


        if (updateId != ' ') {

            setPhoneBook(phoneBook.map(book => {

                if (book.id == updateId) {
                    book.name = name;
                    book.phone = phone;
                }
                return book;
            }))

            setUpdateId(' ')

        }

        else {
            setPhoneBook(phoneBook.concat(newPhoneBook))

        }


    }

    const handleDelete = (id) => {
        setPhoneBook(phoneBook.filter((el) => { return el.id != id; }))
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


    const handleSearch = (params) => {

        console.log(`hello`)

        let found = false
        let foundBook

        phoneBook.map((book) => {
            console.log(`${book.id}${book.name}${book.phone}`)
            if (book.id == search || book.name == search  || book.phone == search ) {
               found = true
               foundBook = book
            }
        })

        if(found){
            alert(foundBook.name)
        }else{
            alert( `${search } Phonebook not found!`)
        }

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

            <form>
                {'Name :  '} <input onChange={handleChangeName} type="text" value={name} />
                {'Phone :  '}  <input onChange={handleChangePhone} type="text" value={phone} />
                <button onClick={handleAdd}>Add Contact</button>
            </form>


        </div>
    )
}
