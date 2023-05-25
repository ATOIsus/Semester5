import { useState } from "react"

export default function Notes(props) {

    const [desc, setDesc] = useState(' ')
    const [notes, setNotes] = useState(props.notes)

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
        setNotes(notes.filter((el) => { return el.id != id; }))
    }

    return (
        <div>
            <h1> Passed Notes  </h1>
            <ul>
                {
                    notes.map(note =>
                        <li key={note.id}>{note.desc} {" "} <button onClick={(id) => handleDelete(note.id)}>Delete</button> </li>
                    )
                }
            </ul>
            <br />
            <form>
                <input onChange={handleChange} type="text" value={desc} />
                {' '}
                <button onClick={handleAdd}>Add</button>
            </form>

        </div>
    )
}