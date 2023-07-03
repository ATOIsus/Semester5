import logo from './logo.svg';
import './App.css';
import Skills from './components/Skills';
import Counter from './components/Counter';
import Notes from './components/Notes';

function App() {    
  
  const skills = [{ id: 1, name: "Coding" }, { id: 2, name: "Plumbing" }, { id: 3, name: "Painting" }]

  return (
    <div className="App">

    <Skills skills ={skills}/>
    <Counter/>
    <Notes/>

     
    </div>
  );
}

export default App;
