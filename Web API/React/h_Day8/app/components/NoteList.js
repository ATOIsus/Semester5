import React, { useContext } from 'react'
import notesContext from './NoteContext'

export default function NoteList() {
    const { notes } = useContext(notesContext)
    console.log(notes)

    return (
        <div>

            <ul>
                {
                    notes.map(note => (
                        <li key={note.id}> {note.desc}</li>
                    ))
                }
            </ul>
        </div>
    )
}
