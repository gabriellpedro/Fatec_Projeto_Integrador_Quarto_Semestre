import React from 'react';

function MaterialOccurrence( {name, price, mesure_unity} ) {
    return (
        <div className="materialOccurrence">
            <h1> {name} </h1>
            <p> Unidade Medida: ${mesure_unity} </p>
            <p> Preço: ${price} </p>
        </div>
    );
}

export default MaterialOccurrence;
