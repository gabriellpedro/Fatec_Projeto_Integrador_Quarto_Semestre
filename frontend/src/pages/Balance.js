import {
  MDBBtn,
  MDBCard,
  MDBCardBody,
  MDBCardImage,
  MDBCol,
  MDBContainer,
  MDBIcon,
  MDBInput,
  MDBRow,
  MDBTypography,
  } from "mdb-react-ui-kit";
  import React from "react";
  import 'mdb-react-ui-kit/dist/css/mdb.min.css';
  // import GenericProduct from "../assets/images/icons/generic_product.avif"
  import BalanceOccurrence from "../components/BalanceOccurrence"
  import BalanceOccurrenceSmall from "../components/BalanceOccurrenceSmall"
  import Logo from '../assets/logo.png';
  import SearchSection from '../layout/MainLayout/Header/SearchSection/index';
  
function Balance() {
  return (
  <section className="h-100 h-custom" style={{ backgroundColor: "#eee" }}>
    <MDBContainer className="py-5 h-100">
      <MDBRow className="justify-content-center align-items-center h-100">
        <MDBCol>
          <MDBCard>
            <MDBCardBody className="p-4">
              <MDBRow>
                <MDBCol lg="7" style={{ overflowY: 'auto', maxHeight: '500px' }}>
                  <MDBTypography tag="h5">
                    {/* <a href="#!" className="text-body">
                      <MDBIcon fas icon="long-arrow-alt-left me-2" /> Continue
                      shopping
                    </a> */}
                    <SearchSection />
                  </MDBTypography>
  
                  <hr />
  
                  <div className="d-flex justify-content-between align-items-center mb-4">
                    <div>
                      <p className="mb-1">Balança atual</p>
                      <p className="mb-0">Há x items na balança desse cliente</p>
                    </div>
                    <div>
                      <p>
                        <span className="text-muted">Busca por:</span>
                        <a href="#!" className="text-body">
                          Preço
                          <MDBIcon fas icon="angle-down mt-1" />
                        </a>
                      </p>
                    </div>
                  </div>
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                    <BalanceOccurrence 
                      name="Material Reciclável"
                      mesure="2"
                      price="9"
                      mesure_unity="KG"
                    />
                </MDBCol>
  
                <MDBCol lg="5">
                  <MDBCard className="bg-primary text-white rounded-3" style={{ backgroundColor: '#ff57666' }}> 
                    <MDBCardBody>
                      <div className="d-flex justify-content-between align-items-center mb-4">
                        <MDBTypography tag="h5" className="mb-0">
                          Detalhes da Balança
                        </MDBTypography>
                        <MDBCardImage src={Logo}
                          fluid className="rounded-3" style={{ width: "45px" }} alt="Avatar" />
                      </div>
  
                      <p className="small">Items pesados: </p>

                      <MDBCol lg="8" style={{ overflowY: 'auto', maxHeight: '200px' }}>
                          <BalanceOccurrenceSmall 
                          name="Material Reciclável"
                          mesure="2"
                          price="9"
                          mesure_unity="KG"
                        />
                          <BalanceOccurrenceSmall 
                          name="Material Reciclável"
                          mesure="2"
                          price="9"
                          mesure_unity="KG"
                        />
                          <BalanceOccurrenceSmall 
                          name="Material Reciclável"
                          mesure="2"
                          price="9"
                          mesure_unity="KG"
                        />
                          <BalanceOccurrenceSmall 
                          name="Material Reciclável"
                          mesure="2"
                          price="9"
                          mesure_unity="KG"
                        />
                          <BalanceOccurrenceSmall 
                          name="Material Reciclável"
                          mesure="2"
                          price="9"
                          mesure_unity="KG"
                        />
                        <a href="#!" type="submit" className="text-white">
                          <MDBIcon fab icon="cc-mastercard fa-2x me-2" />
                        </a>
                        <a href="#!" type="submit" className="text-white">
                          <MDBIcon fab icon="cc-visa fa-2x me-2" />
                        </a>
                        <a href="#!" type="submit" className="text-white">
                          <MDBIcon fab icon="cc-amex fa-2x me-2" />
                        </a>
                        <a href="#!" type="submit" className="text-white">
                          <MDBIcon fab icon="cc-paypal fa-2x me-2" />
                        </a>
                      </MDBCol>
                      {/* <form className="mt-4">
                        <MDBInput className="mb-4" label="Cardholder's Name" type="text" size="lg"
                          placeholder="Cardholder's Name" contrast />
  
                        <MDBInput className="mb-4" label="Card Number" type="text" size="lg"
                          minLength="19" maxLength="19" placeholder="1234 5678 9012 3457" contrast />
  
                        <MDBRow className="mb-4">
                          <MDBCol md="6">
                            <MDBInput className="mb-4" label="Expiration" type="text" size="lg"
                              minLength="7" maxLength="7" placeholder="MM/YYYY" contrast />
                          </MDBCol>
                          <MDBCol md="6">
                            <MDBInput className="mb-4" label="Cvv" type="text" size="lg" minLength="3"
                              maxLength="3" placeholder="&#9679;&#9679;&#9679;" contrast />
                          </MDBCol>
                        </MDBRow>
                      </form> */}
  
                      <hr />
  
                      <div className="d-flex justify-content-between">
                        <p className="mb-2">Subtotal</p>
                        <p className="mb-2">R$ 180.00</p>
                      </div>
  
                      <div className="d-flex justify-content-between">
                        <p className="mb-2">Impostos </p>
                        <p className="mb-2">- R$ 20.00</p>
                      </div>
  
                      <div className="d-flex justify-content-between">
                        <p className="mb-2">Total</p>
                        <p className="mb-2">R$ 160.00</p>
                      </div>
  
                      <MDBBtn color="info" block size="lg">
                        <div className="d-flex justify-content-between">
                          <span>$4818.00</span>
                          <span>
                            Fechar {" "}
                            <i className="fas fa-long-arrow-alt-right ms-2"></i>
                          </span>
                        </div>
                      </MDBBtn>
                    </MDBCardBody>
                  </MDBCard>
                </MDBCol>
              </MDBRow>
            </MDBCardBody>
          </MDBCard>
        </MDBCol>
      </MDBRow>
    </MDBContainer>
  </section>
  );
  }


export default Balance;