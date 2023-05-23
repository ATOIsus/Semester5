'use client'
import { useState } from "react"


import Counter from "@/components/d_SharedState"

export default function Home() {

  const [count, setCount] = useState(0)

  const handleClick = () => setCount(count + 1)

  return (
    <>

    <Counter count={count} handleClick = {handleClick} />
    <Counter count={count}  handleClick = {handleClick}/>

    </>
  )
}


    //Lifting/Sharing state between two different components,
    // From parent to child.



