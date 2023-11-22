import { useSuccessNotification } from '../components/NotificationsToast';
import BannerImage from "../assets/background_home.jpg"
import { Link } from "react-router-dom"
import "../styles/Home.css";
import { React, useEffect } from 'react';

function Home() {
    const { successNotification } = useSuccessNotification();
    useEffect(() => {

        // Check local storage for a stored notification
        const storedNotification = localStorage.getItem('notification');
        if (storedNotification) {
            const { message, type } = JSON.parse(storedNotification);
            
          // Display the notification using your notification component
          // You may also want to clear the notification from local storage after displaying it
            if (type == 'success'){
                successNotification(message);
                localStorage.removeItem('notification');
            }
        }
        }, []);

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
