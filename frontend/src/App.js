import RecycleStatistics from './pages/RecycleStatistics';
import RecycleMaterials from './pages/RecycleMaterials';
import {BrowserRouter as Router,
  Route, Routes} from "react-router-dom";
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import Home from './pages/Home';
import React from 'react';
import CitiesStatistics from './pages/CitiesStatistics';

class App extends React.Component {
  render(){
    return (
      <div className='App'>
        <Router>
          <Navbar />
          <Routes>
            <Route path="/" exact element={<Home/>} />
            <Route path="/getmaterials" exact element={<RecycleMaterials />} />
            <Route path="/reciclestatistics" exact element={<RecycleStatistics />} />
            <Route path="/reciclestatistics/:state" exact element={<CitiesStatistics/>} />
          </Routes>
          <Footer />
        </Router>
      </div>
    );
  }
}

export default App;
