'use client'
import axios from "axios"
import React, { useEffect, useState } from 'react'
import AddNote from "./AddNote"
import NoteList from "./NoteList"
import notesContext from "./NoteContext"

export default function NoteApp() {

    const [notes, setNotes] = useState([])
    const [desc, setDesc] = useState('')
    const [search, setSearch] = useState(' ')


    useEffect(() => {

        axios.get('http://localhost:4000/notes').then(
            res => {
                console.log(res.data)
                setNotes(res.data)
                console.log(notes)
            }
        )
    }, [])

    const handleAdd = (evt) => {
        evt.preventDefault()
        const newNote = {
            id: notes.length + 1,
            desc: desc,
            important: Math.random() < 0.5

        }
        setNotes(notes.concat(newNote))
        setDesc('')
    }

    const handleSearch = (evt) => {
        let found = false
        let foundBook

        phoneBook.map((book) => {
            console.log(search)
            console.log(`${book.id} ${book.name} ${book.phone}`)
            if (book.id == search || book.name == search || book.phone == search) {
                console.log("Payo hai!")
                found = true
                foundBook = book
            } else {
                console.log("Khai payena ho!")

            }
        })

        if (found) {
            alert(`${foundBook.name} found!`)
        } else {
            alert(`${search}  not found!`)
        }

        setSearch('')

    }
    return (
        <div>
            <notesContext.Provider value = {{notes, handleAdd, desc, setDesc}}>

            <input type='text' value={search} onChange={() => setFilter(e.target.values)} />

            <NoteList />

            <br />

            <AddNote/>

            </notesContext.Provider>

        


        </div>
    )
}
