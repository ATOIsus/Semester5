'use client'

import Notes from "@/components/Notes"

export default function Home() {

  const notes = [

    { // Is an object not a dictionary.
      id: 1,
      desc: "today is chilli hai ni",
      important: true
    },
    {
      id: 2,
      desc: "k cha???????????",
      important: false
    },
    {
      id: 3,
      desc: "Thikai cha",
      important: true
    }
  ]

  return (
    <div>
      <Notes notes={notes} />
    </div>
  )
}