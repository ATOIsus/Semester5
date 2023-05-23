import Counter from "@/components/a_Counter"
import Task1 from "@/components/b_Task1"
import Task2 from "@/components/c_Task2"

//Components are pre-rendered in server side first in Next.js.

//Function expression, (arrow/anonymous function)
//It is used because so that it is accessed only when needed.
//It cannot be accessed before its definition.
//Prevent unauthorized access by not keeping in global scope.

const Hello = () => {  //props is an object type.
  return(
    <>
    <p> Hello There Hai </p>
    </>

  )
}



const HelloFunction = (props) => {  //props is an object type.
  return(
    <>
      {console.log(props)}    
      <p> Hello There {props.name} of age {props.age}</p>
    </>
  )
}



const destructureExample1 = (props) => {  
  const {name, age}  = props
  return(
    <>
      {console.log(props)}    
      <p> Hello There {props.name} of age {props.age}</p>
    </>
  )
}


const destructureExample2 = ({name, age} ) => {  
  return(
    <>
      {console.log(props)}    
      <p> Hello There {props.name} of age {props.age}</p>
    </>
  )
}



//Normal function.
//Memory is allocated where whole function is loaded in RAM before interpretation process.
//It can be accessed before its definition and anywhere because it is in the global scope.
//Wasted function because
export default function Home() {

  const now = new Date()
  const parameter = "Ram"

  const friends = [
    {name : "asd", age : 11},
    {name : "as123d", age : 111},
    {name : "as123122d", age : 121},
  ]



  return (
    <>

    <h1> Hello World, React! </h1>
    <p> Current time is {now.toString()}. </p>
    <p> . </p>
    <p> . </p>
    <p> . </p>

    <HelloFunction argument = {parameter}/>
    <HelloFunction name = {parameter} age= {111}/>
    <p> . </p>
    <p> . </p>
    <p> . </p>


    {
      friends.map(friends => <HelloFunction name = {friends.name} age={friends.age} />
      )
    }
    <p> . </p>
    <p> . </p>
    <p> . </p>


    <Counter />

    <p> . </p>
    <p> . </p>
    <p> . </p>


    <Task1/>

    <p> . </p>
    <p> . </p>
    <p> . </p>


    <Task2/>

    <p> . </p>
    <p> . </p>
    <p> . </p>




    </>
  )
}





// Home is a component.
// At least one HTML object needs to be returned.
// Although, <h1> seems like HTML but in reality it is JSX (Java Script XML).

// export default function Home() {
//   return (
//     <h1> Hello World, React! </h1>
//   )
// }



//Home returns only one component, so in below

// return (
//   <h1> Hello World, React! </h1>
//   <p> Current time is {now.toString()} </p>
// )




//Only <p> is shown because Home returns only one component.

//So to return multiple UI components.

// return (
//   <> //Fragments, <div> could be used.

//   <h1> Hello World, React! </h1>
//   <p> Current time is {now.toString()} </p>
  
//   </>

// )







// export default function Home() {

//   const now = new Date()

//   return (
//     <>

//     <h1> Hello World, React! </h1>
//     <p> Current time is {now.toString()}. </p>

//     <HelloFunction argument = {parameter}/>


//     <HelloFunction name = {parameter} age= {111}/>
    
//     </>


  
//   )
// }
