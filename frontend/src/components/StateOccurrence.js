import React from "react";

function StateOccurrence({ state, paper, steel, glass, cooperatives }) {
    return (
        <div className="stateOccurrence">
            <h1> {state} </h1>
            <p> Papel: ${paper} </p>
            <p> Metal: ${steel} </p>
            <p> Papel: ${glass} </p>
            <p> Cooperativas: ${cooperatives} </p>
        </div>
    );
}

export default StateOccurrence;
