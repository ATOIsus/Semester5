'use client'

import PhoneBook from "@/components/PhoneBook"

export default function Home() {

  const book = [
    {
      id: 1,
      name: "Someone ni hai",
      phone: "9829018278"
    }
  ]

  return (
    <div>
      <PhoneBook contacts={book} />
    </div>
  )
}