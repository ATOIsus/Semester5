import React from 'react'
import { useDispatch, useSelector } from 'react-redux'

export default function NoteFilter() {
    const dispatch = useDispatch()
    const filter = useSelector(state => state.filter)

    return (
        <div>
            <input type='text'
                placeholder='search notes ...'
                value={filter}
                onChange={(e) => dispatch({
                    type: 'setFilter',
                    payload: e.target.value
                })} />
        </div>
    )
}
