import React from "react";

function CityOccurrence({ city, state, plastic, paper, steel, glass, cooperatives }) {
    return (
        <div className="cityOccurrence">
            <h1> {city} - {state}</h1>
            <p> Plástico: ${plastic} </p>
            <p> Papel: ${paper} </p>
            <p> Metal: ${steel} </p>
            <p> Papel: ${glass} </p>
            <p> Cooperativas: ${cooperatives} </p>
        </div>
    );
}

export default CityOccurrence;
