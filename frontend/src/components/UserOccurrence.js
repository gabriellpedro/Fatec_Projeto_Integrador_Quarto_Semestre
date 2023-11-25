import GenericUser from "../assets/images/users/generic_user.png"
import { React } from 'react';
import {
    MDBCard,
    MDBCardBody,
    MDBCardImage,
    MDBIcon,
    MDBTypography,
    } from "mdb-react-ui-kit";
    import axios from 'axios';

function BalanceOccurrence({  name, user_id, email, is_active, onUserOccurrenceClick }) {
    const handleUserOperation = () => {
    
        // const handleSuccess = () => {
        //   successNotification('Registro Realizado com Sucesso!');
        // };
        
        const values = { user_id_occurrence: user_id };
        console.log("Values", values)
        const URL = 'http://localhost:8000/materials/operation/';
        axios.get(URL,{
            headers: {
            'content-type': 'application/json',
            },
            params: values,
        })
        .then(response => {
            console.log(response)
            try{
                if (response.status === 200) {
                    localStorage.setItem('selecteduser', JSON.stringify(response.data));
                    onUserOccurrenceClick(name);
                }
            } catch(error){
                console.log('JSON PARSE', error)
            }
        }
        )};

    return (
        <button
        type="button"
        className="btn"
        style={{
            textDecoration: 'none',
            padding: 0,
            border: 'none',
            background: 'none',
            color: 'inherit',
            textAlign: 'left',
            width: '100%'
        }}
        onClick={handleUserOperation}>
        <MDBCard className="mb-3">
            <MDBCardBody>
            <div className="d-flex justify-content-between">
                <div className="d-flex flex-row align-items-center">
                <div>
                    <MDBCardImage
                    src={GenericUser}
                    fluid className="rounded-3" style={{ width: "65px" }}
                    alt="Balance Item" />
                </div>
                <div className="ms-3">
                    <MDBTypography tag="h5">
                    {name}
                    </MDBTypography>
                    <p className="small mb-0"> {email} </p>
                </div>
                </div>
                <div className="d-flex flex-row align-items-center">
                <div style={{ width: "50px" }}>
                    <MDBTypography tag="h5" className="fw-normal mb-0">
                    {is_active}
                    </MDBTypography>
                </div>
                <div style={{ width: "80px" }}>
                    <MDBTypography tag="h5" className="mb-0">
                    ID:  {user_id}
                    </MDBTypography>
                </div>
                <a href="#!" style={{ color: "#cecece" }}>
                    <MDBIcon fas icon="trash-alt" />
                </a>
                </div>
            </div>
            </MDBCardBody>
        </MDBCard>
    </button>
    )

}

export default BalanceOccurrence;
