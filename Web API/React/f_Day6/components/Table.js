import axios from "axios"
import { useEffect, useState } from "react"
import { AiFillEdit } from "react-icons/ai"


export default function Table() {

    const [notes, setNotes] = useState([])
    const [updateId, setUpdateId] = useState()

    const [desc, setDesc] = useState(' ')



    const baseUrl = 'http://localhost:4000/notes'


    useEffect(() => {

        axios.get(baseUrl)
            .then(response => {
                console.log(response)
                setNotes(response.data)
            })

    }, [])


    const handleDelete = (id) => {
        if (window.confirm(`Are you sure to delete note with id${id}`)) {
            axios.delete(`${baseUrl}/${id}`).then((response) => {
                console.log(response)
                setNotes(notes.filter(el => el.id != id))
            }
            )
        }
    }


    const handleAdd = (event) => {
        event.preventDefault()
        const newNote = {
            desc: desc,
            important: Math.random() < 0.5
        }


        axios.post(baseUrl, newNote).then(response => {
            console.log(response.data)
            setNotes(notes.concat(newNote))
        })
        setDesc('')
    }


    const handleChange = (event) => {
        console.log(event.target.value)
        setDesc(event.target.value)
    }


    const handleEdit = () => {


        const note = notes.find(n => n.id === updateId)

        console.log(note)



        axios.put(`${baseUrl}/${note.id}`, { ...note, desc: desc }).then(response => {
            const updatedNote =
                notes.map(n => n.id === note.id ?

                    { ...note, desc: desc }
                    : n

                )
            setNotes(updatedNote)
        })

        setDesc('')
        setUpdateId(0)
    }

   


    return (
        <div className="overflow-x-auto">
            <button className="btn btn-block" onClick={() => window.my_modal_2.showModal()}>Add Note</button>
            <dialog id="my_modal_2" className="modal">
                <form method="dialog" className="modal-box">
                    <h3 className="font-bold text-lg">Add Note</h3>
                    <input class="bg-gray-50" onChange={handleChange} type="text" value={desc} />

                    {'   '}
                    <button className="btn btn-active btn-neutral" onClick={handleAdd}>Add</button>

                </form>
                <form method="dialog" className="modal-backdrop">
                    <button>close</button>
                </form>
            </dialog>
            <table className="table table-zebra">

                {/* head */}
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Desc</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>


                    {
                        notes.map(note =>
                            <tr>
                                <td>{note.id}</td>
                                <td>{note.desc}</td>
                                <td>
                                    {/* The button to open modal */}
                                    <label htmlFor="my_modal_7" className="btn" onClick={() => {setDesc(note.desc); setUpdateId(note.id)}}><AiFillEdit /></label>

                                    {/* Put this part before </body> tag */}
                                    <input type="checkbox" id="my_modal_7" className="modal-toggle" />
                                    <div className="modal">
                                        <div className="modal-box">
                                            <input class="bg-gray-50" onChange={handleChange} type="text" value={desc} />

                                            {'      '}
                                            <button className="btn btn-active btn-neutral" onClick={(id) => handleEdit(note.id)}>Update</button>

                                        </div>
                                        <label className="modal-backdrop" htmlFor="my_modal_7">Close</label>
                                    </div>

                                    {'  '}
                                    <button className="btn btn-active btn-neutral" onClick={(id) => handleDelete(note.id)}>Delete</button>

                                </td>

                            </tr>
                        )
                    }


                </tbody>
            </table>
        </div>
    )
}