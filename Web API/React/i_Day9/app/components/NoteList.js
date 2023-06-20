import React from 'react'
import { useSelector } from 'react-redux'

export default function NoteList() {
    const notes = useSelector(state => state.notes)
    const filter = useSelector(state => state.filter)

    return (
        <div>
            <ul>
                {
                    notes.filter(note => note.desc.toLowerCase().includes(filter.toLocaleLowerCase()))
                        .map(note => (
                            <li key={note.id}>
                                {note.desc}
                            </li>
                        ))
                }
            </ul>
        </div>
    )
}
