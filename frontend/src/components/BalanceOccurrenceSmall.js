import GenericProduct from "../assets/images/icons/generic_product.avif"
import { React, useState } from 'react';
import {
    MDBCard,
    MDBCardBody,
    MDBCardImage,
    MDBIcon,
    MDBTypography,
    } from "mdb-react-ui-kit";

function BalanceOccurrenceSmall({ name, mesure, price, mesure_unity }) {
    return (
        <MDBCard className="mb-2" style={{ backgroundColor: '#20B2AA', pointerEvents: 'auto' }}>
            <MDBCardBody>
            <div className="d-flex justify-content-between">
                <div className="d-flex flex-row align-items-center">
                <div>
                    <MDBCardImage
                    src={GenericProduct}
                    fluid className="rounded-3" style={{ width: "70px" }}
                    alt="Balance Item" />
                </div>
                <div className="ms-3">
                    <MDBTypography tag="h5">
                    {name}
                    </MDBTypography>
                    <p className="small mb-0"> {mesure_unity} </p>
                </div>
                </div>
                <div className="d-flex flex-row align-items-center">
                <div style={{ width: "50px" }}>
                    <MDBTypography tag="h5" className="fw-normal mb-0">
                    {mesure}
                    </MDBTypography>
                </div>
                <div style={{ width: "70px" }}>
                    <MDBTypography tag="h5" className="mb-0">
                    R$ {price}
                    </MDBTypography>
                </div>
                <a href="#!" style={{ color: "#cecece" }}>
                    <MDBIcon fas icon="trash-alt" />
                </a>
                </div>
            </div>
            </MDBCardBody>
      </MDBCard>

    )

}

export default BalanceOccurrenceSmall;
