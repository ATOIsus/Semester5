'use client'
import { useState } from "react"

export default function Task2() {


    const [feedback, setFeedback] = useState({ good: 0, neutral: 0, bad: 0 })

    const [history, setHistory] = useState([])

    const { good, neutral, bad } = feedback



    // const [good, setGood] = useState(0)
    // const [neutral, setNeutral] = useState(0)
    // const [bad, setBad] = useState(0)

    // const handleGood = () => setGood(good + 1)
    // const handleNeutral = () => setNeutral(neutral + 1)
    // const handleBad = () => setBad(bad + 1)

    //#### AOnly good is incremented, other remain the same
    // const handleGood = () => {
    //     setFeedback(
    //         {
    //             good: feedback.good + 1,
    //             neutral: feedback.neutral,
    //             bad: feedback.neutral
    //         }
    //     )
    // }


    //Syntax sugar

    const handleGood = () => {
        setFeedback(
            {
                ...feedback,
                good: feedback.good + 1
            }        
        )
        setHistory(history.concat('G'))
    }

    const handleNeutral = () => {
        setFeedback(
            {
                good: feedback.good,
                neutral: feedback.neutral + 1,
                bad: feedback.bad
            }
        )
        setHistory(history.concat('N'))
    }

    const handleBad = () => {
        setFeedback(
            {
                good: feedback.good,
                neutral: feedback.neutral,
                bad: feedback.bad + 1
            }
        )
        setHistory(history.concat('B'))

    }


    const Statistics = (props) => { //Props: Parameter( is an object)

        const { good, bad, neutral, history } = props //Destructure: Extract properties.
        //Can use "props.good" as well

        return (
            <>
                <h2> Statistics </h2>

                <p>good: {good}</p>
                <p>neutral: {neutral}</p>
                <p>bad: {bad}</p>

                <p>All: {good + neutral + bad}</p>
                <p>Average: {(good - bad) / (good + neutral + bad)}</p>

                <p> {history} </p>

            </>

        )
    }


    const ButtonHai = (props) => {
        const { functionHai, text } = props
        return (
            <button onClick={functionHai}> {text} </button>
        )
    }






    return (
        <div>
            <h1> Give Feedback </h1>

            {/* <button onClick={handleGood}> Good </button>
            <button onClick={handleNeutral}> Neutral </button>
            <button onClick={handleBad}> Bad </button> */}

            <ButtonHai
                functionHai={handleGood}
                text={"Good"} />

            <ButtonHai
                functionHai={handleNeutral}
                text={"Neutral"} />

            <ButtonHai
                functionHai={handleBad}
                text={"Bad"} />


            <Statistics
                good={good}
                neutral={neutral}
                bad={bad}
                history = {history}
            />


            <p>.</p>
            <p>.</p>
            <p>.</p>

        </div>
    )
}




//Three ways to pass arguments:


// 1) As props and access using props.property.
// 2) Destructure in child component.
// 3) Set variable names directly in the definition of component/function







//Some functions are asynchronous so, it could create runtime error.
// SO, TRY YOUR BEST TO USE BUILT IN FUNCTIONS () INSTEAD OF 

//Creates new copy of  and works on that.