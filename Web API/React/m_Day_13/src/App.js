import './App.css';
import Counter from './components/Counter';
import Notes from './components/Notes';
import Skills from './components/Skills';

function App() {    
  
  const skills = [{ id: 1, name: "Coding" }, { id: 2, name: "Plumbing" }, { id: 3, name: "Painting" }]

  const handleDelete = () => {
    alert('Deleted hai!')
  }

  return (
    <div className="App">

    <Skills skills ={skills}/>
    <Counter/>
    <Notes handleDelete={handleDelete} />

     
    </div>
  );
}

export default App;
