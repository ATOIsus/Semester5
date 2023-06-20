const { default: axios } = require("axios")

const baseURL = "http://localhost:4000/notes"

const getAllNotes = () => axios.get(baseURL).then(res => res.data)

const createNote = (newNote) => axios.post(baseURL, newNote).then(res => res.data)


export default { getAllNotes, createNote }