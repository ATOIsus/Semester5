'use client'
import React, { useEffect } from 'react'
import noteService from '../services/noteService'
import NoteFilter from './NoteFilter'
import NoteList from './NoteList'
import AddNote from './AddNote'
import { useDispatch } from 'react-redux'



export default function NoteApp() {

    const dispatch = useDispatch()

    useEffect(() => {
        noteService.getAllNotes()
            .then(data => dispatch({
                type: 'setNotes',
                payload: data
            }))
    }, [])

    return (
        <div>
            <NoteFilter />

            <NoteList />

            <AddNote />
        </div>
    )
}