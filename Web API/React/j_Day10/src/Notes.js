import React, { useEffect, useState } from 'react'

const useNotes = () => {

    const [notes, setNotes] = useState([])

    useEffect(() => {

        fetch('http://localhost:4000/notes')
            .then(res => res.json())
            .then(data => setNotes(data))

    }, [])

    return notes

}

export default function Notes() {


    const notes = useNotes()
       
    return (
        <div>
            <h2>List of notes</h2>

            {
                notes.map(note => (
                    <li key={note.id}>{note.desc}</li>
                ))
            }

        </div>
    )
}
