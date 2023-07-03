import React, { useEffect, useState } from 'react'

export default function Skills({ skills }) {

    const [loggedIn, setLoggedIn] = useState(false)

    useEffect(() => {
        setTimeout(() => {
            setLoggedIn(true)
        }, 500)
    })

    return (
        <div>
            <h2>List of skills</h2>
            <ul>
                {skills.map(skill => {
                    <li key={skill.id}>{skill.name}</li>
                })}
            </ul>

            {
                loggedIn ? (<button onClick={() => setLoggedIn(false)}>Log Out</button>)
                    : (<button onClick={() => setLoggedIn(true)}>Log In</button>)
            }


        </div>
    )
}
