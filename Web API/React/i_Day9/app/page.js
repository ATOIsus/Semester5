'use client'
import { Provider } from "react-redux";
import NoteApp from "./components/NoteApp";
import noteStore from "./services/noteStore";

export default function Home() {
  return (
    <div>
      <h1>Notes App</h1>
      <Provider store={noteStore}>
        <NoteApp />
      </Provider>
    </div>
  )
}
