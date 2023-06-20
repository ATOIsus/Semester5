import React from 'react'
import noteService from '../services/noteService'
import { useDispatch, useSelector } from 'react-redux'

export default function AddNote() {

    const dispatch = useDispatch()
    const desc = useSelector(state => state.desc)
    const notes = useSelector(state => state.notes)

    const handleAdd = (evt) => {
        evt.preventDefault()
        if (desc.trim() !== "") {
            const newNote = {
                desc: desc,
                important: Math.random() < 0.5
            }

            noteService.createNote(newNote)
                .then(data => dispatch({
                    type: 'setNotes',
                    payload: notes.concat(data)
                }))
            dispatch({ type: 'setDesc', payload: "" })
        }
    }
    return (
        <div>
            <form onSubmit={handleAdd}>
                <input type='text' placeholder='add note ...'
                    value={desc}
                    onChange={(e) => dispatch({ type: 'setDesc', payload: e.target.value })}
                />
                <button>add</button>
            </form>
        </div>
    )
}
