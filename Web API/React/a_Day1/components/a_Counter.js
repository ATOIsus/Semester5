'use client' //useState is to be used in client side not server side. By default Next takes components as server side.
import {useState} from "react"

export default function Counter(){

    const [count, setCount] = useState(0) //Hook .
    // count is called State. Anyone can read but not change.
    // setCount is a function, setter to change value of count.
    // 0 is initial value for count.


    const handleClick = () => {
        setCount(count + 1)
        // Cannot do : count += 1
        // UI is rerendered
    }

    return (
        <div>
            <p>{count}</p>
            <button onClick={handleClick}>plus</button> 
        </div>
    )
}