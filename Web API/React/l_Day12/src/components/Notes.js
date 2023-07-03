import React, { useEffect, useState } from 'react'

export default function Notes() {
    const [notes, setNotes] = useState([])
    const [error, setError] = useState()


    useEffect(() => {
        fetch('https://jsonplaceholder.typicode.com/todos')
            .then(res => res.json())
            .then(data => setNotes(data))
            .catch(err => setError('Error fetching data.'))
    }, [])


    return (
        <div>
            <h1>List of notes</h1>
            {error ? <p>{error}</p>

                : <ul>
                    {
                        notes.map(note => (
                            <li key={note.id}>{note.title}</li>
                        ))
                    }
                </ul>
            }

        </div>
    )
}
