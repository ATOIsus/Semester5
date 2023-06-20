const { legacy_createStore } = require("redux")

const noteReducer = (state = {
    notes: [],
    desc: "",
    filter: ""
}, action) => {
    switch (action.type) {
        case 'setNotes':
            return {
                ...state,
                notes: action.payload
            }
        case 'setDesc':
            return {
                ...state,
                desc: action.payload
            }
        case 'setFilter':
            return {
                ...state,
                filter: action.payload
            }
        default:
            return state
    }
}

const noteStore = legacy_createStore(noteReducer)

export default noteStore