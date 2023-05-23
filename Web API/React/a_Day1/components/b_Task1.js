'use client'
import { useState } from "react"

export default function Task1() {

    const [count, setAdd, setSub, setZero] = useState(0)


    const handleClick = () => {
        setAdd(count + 1)
    }

    
    const handleClickSub = () => {
        setAdd(count - 1)
    }
    
    const handleClickZero = () => {
        setAdd(count - count)
    }

    return (
        <div>
            <p>{count}</p>
            <button onClick={handleClick}>plus</button>
            <p/>
            <button onClick={handleClickSub}>minus</button>
            <p/>
            <button onClick={handleClickZero}>zero</button>
            <p/>
        </div>
    )
}