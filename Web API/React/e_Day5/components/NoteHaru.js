
//REACT cannot give HTTP request.!!!!!!!!!!!!!!!!!!!!!!!!!!
import axios from "axios"
import { useEffect, useState } from "react"

export default function NotesHaru() {

    const [isEdit, setIsEdit] = useState(true)
    const [updatedNote, setUpdateNote] = useState({})

    const [showToggle, setShowToggle] = useState(true)


    const [desc, setDesc] = useState(' ')
    const [notes, setNotes] = useState([])

    const baseUrl = 'http://localhost:4000/notes'

    useEffect(() => {  //React calls useEffect when components are rendered/re-rendered

        axios.get(baseUrl)
            .then(response => {
                console.log(response)
                setNotes(response.data)
            })

    }, []) // [] is used because setNotes re-renders the component and the request to server is done in a infinite loop, so to request only once



    const filteredNotes =
        showToggle ? notes
            :
            notes.filter(n => n.important == true)



    const handleChange = (event) => {
        console.log(event.target.value)
        setDesc(event.target.value)
    }

    const handleAdd = (event) => {
        event.preventDefault()
        const newNote = {
            desc: desc,
            important: Math.random() < 0.5
        }


        axios.post(baseUrl, newNote).then(response => {
            console.log(response.data)
            setNotes(notes.concat(newNote))
        })
        setDesc('')
    }

    const handleDelete = (id) => {
        if (window.confirm(`Are you sure to delete note with id${id}`)) {
            axios.delete(`${baseUrl}/${id}`).then((response) => {
                console.log(response)
                setNotes(notes.filter(el => el.id != id))
            }
            )
        }
    }

    const handleEdit = (id) => {


        setIsEdit(false)

        const note = notes.find(n => n.id == id)

        setUpdateNote(note)
        setDesc(note.desc)
    }

    const handleSave = (event) => {
        event.preventDefault() // Default behavior: Form tries to send request to server and re-render the page that re-initializes the states(variables)

        axios.put(`${baseUrl}/${updatedNote.id}`, { ...updatedNote, desc: desc }).then(response => {
            console.log(response.data)
            const updatedNotes =
                notes.map(n => n.id === updatedNote.id ?

                    { ...updatedNote, desc: desc }
                    : n

                )
            setNotes(updatedNotes)
        })

        const updatedNotes = notes.map(n => n.id == updatedNote.id ? { ...updatedNote, desc: desc } : n)   // ... is object destructure.

        setIsEdit(true)
        setDesc('')
    }

    const handleShow = () => {

        setShowToggle(!showToggle)

    }

    return (
        <div>
            <h1> Passed Notes  </h1>
            <button onClick={handleShow}>
                show {showToggle ? 'important' : 'all'}
            </button>

            <ul>
                {
                    filteredNotes.map(note =>
                        <li key={note.id}>
                            {note.desc}
                            {' '}
                            <button onClick={() => handleDelete(note.id)}>delete</button>
                            <button onClick={() => handleEdit(note.id)}>edit</button>
                        </li>)
                }
            </ul>

            <h1> Same thing but different logic  </h1>
            <ul>
                {
                    showToggle ?

                        notes.map(note =>
                            <li key={note.id}>{

                                note.desc} {" "}
                                <button onClick={(id) => handleDelete(note.id)}>Delete</button>
                                <button onClick={(id) => handleEdit(note.id)}>Edit</button>


                            </li>
                        )

                        :

                        notes.map(note => {
                            console.log(note.important)

                            if (note.important == true) {
                                return <li key={note.id}>{note.desc} {" "}
                                    <button onClick={(id) => handleDelete(note.id)}>Delete</button>
                                    <button onClick={(id) => handleEdit(note.id)}>Edit</button>
                                </li>

                            }
                        }

                        )


                }
            </ul>
            <br />
            <form>
                <input onChange={handleChange} type="text" value={desc} />
                {' '}
                {
                    isEdit ? <button onClick={handleAdd}>Add</button> //ternary operator
                        :
                        <button onClick={handleSave}>Update</button>
                }

            </form>

        </div>
    )
}




// Conditional rendering: 30 May, 2023.
// npm install -g json-server
// -g is for global use // is for development