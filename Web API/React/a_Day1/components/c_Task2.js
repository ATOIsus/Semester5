'use client'
import { useState } from "react"

export default function Task2() {

    const [good, setGood] = useState(0)
    const [neutral, setNeutral] = useState(0)
    const [bad, setBad] = useState(0)


    const handleGood = () => {
        setGood(good + 1)
    }

    const handleNeutral = () => {
        setNeutral(neutral + 1)
    }

    const handleBad = () => {
        setBad(bad + 1)
    }


    return (
        <div>
            <h1> Give Feedback </h1>

            <button onClick={handleGood}> Good </button>
            <button onClick={handleNeutral}> Neutral </button>
            <button onClick={handleBad}> Bad </button>

            <h2> Statistics </h2>

            <p>good: {good}</p>
            <p>neutral: {neutral}</p>
            <p>bad: {bad}</p>

            <p>All: {good + neutral + bad}</p>
            <p>Average: {(good - bad) / (good + neutral + bad)}</p>


        </div>
    )
}