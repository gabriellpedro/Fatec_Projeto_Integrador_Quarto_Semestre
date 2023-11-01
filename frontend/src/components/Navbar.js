import React, { useState } from 'react';
import Logo from '../assets/logo.png';
import {Link} from 'react-router-dom';
// import HomeIcon from '@mui/icons-material/Home';
import ReorderIcon from '@mui/icons-material/Reorder';
import "../styles/Navbar.css";

function Navbar() {

    const [openLinks, setOpenLinks] = useState(false)


    const toggleNavbar = () => {
        setOpenLinks(!openLinks)
    };
    return (
        <div className='navbar'>
            <div className='leftSide' id={openLinks ? "open" : "close"}>
                <Link to='/'>
                    <img src={Logo} />
                </Link>
                <div className='hiddenLinks'>
                    <Link to={"/"}> Home </Link>
                    <Link to={"/menu"}> Menu </Link>
                    <Link to={"/sobrenos"}> Sobre nós </Link>
                    <Link to={"/ecoins"}> E-coins </Link>
                    <Link to={"/reciclestatistics"}> Reciclagem </Link>
                </div>
            </div>
            <div className='rightSide'>
                <Link to={"/"}> Home </Link>
                <Link to={"/menu"}> Menu </Link>
                <Link to={"/sobrenos"}> Sobre nós </Link>
                <Link to={"/ecoins"}> E-coins </Link>
                <Link to={"/reciclestatistics"}> Reciclagem </Link>
                <button onClick={toggleNavbar}>
                    <ReorderIcon />
                </button>
            </div>
                
        </div>
  );
}

export default Navbar;
