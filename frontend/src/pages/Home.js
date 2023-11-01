import BannerImage from "../assets/background_home.jpg"
import { Link } from "react-router-dom"
import "../styles/Home.css";
import React from 'react';

function Home() {
    return (
        <div className='home' style={{ backgroundImage: `url(${BannerImage})`}}>
            <div className='headerHomeContainer'>
                <h1> Ecoponto </h1>
                <p> Resíduos em Moedas </p>
                <Link to="/getmaterials">
                    <button> Reciclar </button>
                </Link>
            </div>
        </div>
    );
}

export default Home;
