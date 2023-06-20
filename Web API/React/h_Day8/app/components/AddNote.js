import React, { useContext } from 'react'
import notesContext from './NoteContext'

export default function AddNote() {

    const { handleAdd, desc, setDesc } = useContext(notesContext)

    return (
        <div>

            <form onSubmit={handleAdd}>
                <input type="text" placeholder="description for note"
                    value={desc}
                    onChange={(e) => setDesc(e.target.value)}

                />
                <button>add note</button>

            </form>


        </div>
    )
}
