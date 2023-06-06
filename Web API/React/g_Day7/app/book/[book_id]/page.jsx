'use client'

import { useRouter } from 'next/navigation' // By default it is 'next/router' but need to change to  'next/navigation'
import React from 'react'

export default function page({ params }) {


    const router = useRouter()

    const handleDelete = () => {
        router.push("/book")

    }

    console.log(params)
    return (
        <div>

            <h1>This is dynamic and you entered : {params.book_id} </h1>

            <button onClick={handleDelete}>delete</button>

        </div>
    )
}
