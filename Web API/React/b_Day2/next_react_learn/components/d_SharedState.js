'use client' //useState is to be used in client side not server side. By default Next takes components as server side.
import {useState} from "react"

export default function Counter(props){

    const {count, handleClick} = props

    return (
        <div>
            <p>{count}</p>
            <button onClick={handleClick}>plus</button> 
        </div>
    )
}


//React supports one way data flow only!