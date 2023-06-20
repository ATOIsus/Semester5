import logo from './logo.svg';
import './App.css';
import { useCallback, useMemo, useRef, useState } from 'react';
import Notes from './Notes';


function SortedList({ list, sortFunc }) {

  const sortedNames = useMemo(() => {
    console.log("sorting list")
    return [...list].sort(sortFunc)
  }, [list, sortFunc])
  return (<div>

    {sortedNames.map(name => <li key={name}>{name}</li>)}
  </div>)

}

function App() {


  const [numbers] = useState([10, 20, 30])
  const total = useMemo(() => {
    console.log('calculating total')
    return numbers.reduce((acc, n) => acc + n, 0)
  }, [])

  const [count, setCount] = useState(0)

  const inputRef = useRef()

  const [names, setNames] = useState(["Ram", "Laxman", "Hari"])

  const sortFunc = useCallback((a, b) => a.localeCompare(b) * -1, [])

  const addName = () => {
    setNames(names.concat(inputRef.current.value))
    inputRef.current.value = ''
  }




  return (
    <div className="App">

      <p> Total : {total}</p>
      <button onClick={() => setCount(count + 1)}>Count : {count}</button>

      <input type='text' ref={inputRef} />
      <button onClick={addName}>Add Name</button>

      <SortedList list={names} sortFunc={sortFunc} />

      <Notes/>



    </div>
  );
}

export default App;
