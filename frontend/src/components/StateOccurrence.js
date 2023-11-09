import React from "react";

function StateOccurrence({ simbol, image, state, paper, steel, glass, cooperatives }) {
    return (
        <div className="stateOccurrence">
            <div style={{ backgroundImage: `url(${image})` }}> </div>
            <h1> {state} </h1>
            <p> Papel: {paper} </p>
            <p> Metal: {steel} </p>
            <p> Papel: {glass} </p>
            <p> Cooperativas: {cooperatives} </p>
        </div>
    );
}

export default StateOccurrence;
