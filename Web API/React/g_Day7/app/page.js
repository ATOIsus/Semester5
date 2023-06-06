import Image from 'next/image'
import Link from 'next/link'

export default function page() {
  return (
    <div> <h1> Home page </h1>


      <li>
        <Link href="/about">About</Link>
      </li>
      
      <li>
        <Link href="/contact">Contact</Link>
      </li>
    </div>


  )


}
