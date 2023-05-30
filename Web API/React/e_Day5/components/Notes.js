import { useState } from "react"

export default function Notes(props) {

    const [toggle, setToggle] = useState(true)
    const [updatedNote, setUpdateNote] = useState({})

    const [showToggle, setShowToggle] = useState(true)


    const [desc, setDesc] = useState(' ')
    const [notes, setNotes] = useState(props.notes)

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
            id: notes.length + 1,
            desc: desc,
            important: Math.random() < 0.5
        }
        console.log(newNote) // Debugging is done through console in browser.
        setNotes(notes.concat(newNote))
    }

    const handleDelete = (id) => {
        if (window.confirm(`Are you sure to delete note with id${noteId}`)) {
            setNotes(notes.filter(el => el.id != id))
        }
    }

    const handleEdit = (id) => {


        setToggle(false)
        //alert(id)

        const note = notes.find(n => n.id == id)

        setUpdateNote(note)
        setDesc(note.desc)
    }

    const handleUpdate = (event) => {
        event.preventDefault() // Default behavior: Form tries to send request to server and re-render the page that re-initializes the states(variables)
        const updatedNotes = notes.map(n => n.id == updatedNote.id ? { ...updatedNote, desc: desc } : n)   // ... is object destructure.

        setNotes(updatedNotes)

        setToggle(true)
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
                    toggle ? <button onClick={handleAdd}>Add</button> //ternary operator
                        :
                        <button onClick={handleUpdate}>Update</button>
                }

            </form>

        </div>
    )
}




// Conditional rendering: 30 May, 2023.


// npm install -g json-server 
// -g is for global use // is for development


//  npx json-server --port 4000 --watch db.json




// npm install axios