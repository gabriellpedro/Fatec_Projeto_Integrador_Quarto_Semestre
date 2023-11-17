import { IconNews } from '@tabler/icons-react';
import { IconMagnet } from '@tabler/icons-react';
import { IconBuilding } from '@tabler/icons-react';
import { IconGlass } from '@tabler/icons-react';
import { React } from 'react';

// constant
const icons = {
    IconNews,
    IconMagnet,
    IconBuilding,
    IconGlass,

};


function StateOccurrence({ simbol, image, state, paper, steel, glass, cooperatives }) {
    return (
        <div className="stateOccurrence">
            <div style={{ backgroundImage: `url(${image})` }}> </div>
            <h1> {state} </h1>
            <p> <icons.IconNews/> Papel: {paper} <icons.IconMagnet/> Metal: {steel} </p>
            <p> <icons.IconGlass/> Vidro: {glass} <icons.IconBuilding/> Cooperativas: {cooperatives}</p>
        </div>
    );
}

export default StateOccurrence;
