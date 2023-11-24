import React from 'react';
import { MDBCol, MDBContainer, MDBRow, MDBCard, MDBCardText, MDBCardBody, MDBCardImage, MDBBtn, MDBTypography, MDBIcon } from 'mdb-react-ui-kit';

export default function ProfileStatistics() {
    var number = Math.floor(Math.random() * (6 - 1 + 1)) + 1; 
    const avatar = `https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava${number}-bg.webp`
    const storedUserOperations = localStorage.getItem('selecteduser');
    console.log('STORAGED', storedUserOperations)
    var foundUserOperations = [];
    if (storedUserOperations) {
        foundUserOperations = JSON.parse(storedUserOperations);
        console.log('STORAGED', foundUserOperations[0].current_total )
      }

  return (
    <div className="vh-80" style={{ backgroundColor: '#eee' }}>
      <MDBContainer className="container py-4 h-80">
        <MDBRow className="justify-content-center align-items-center h-80">
          <MDBCol md="15" xl="10">
            <MDBCard style={{ borderRadius: '15px' }}>
              <MDBCardBody className="text-center">
                <div className="mt-3 mb-4">
                  <MDBCardImage src={avatar}
                    className="rounded-circle" fluid style={{ width: '100px' }} />
                </div>
                <MDBTypography tag="h4">Ecofriend</MDBTypography>
                <MDBCardText className="text-muted mb-4">
                  @EcoFriend <span className="mx-2">|</span> <a href="#!">ecofriend.com</a>
                </MDBCardText>
                <div className="mb-4 pb-2">
                  <MDBBtn outline floating>
                    <MDBIcon fab icon="facebook" size="lg" />
                  </MDBBtn>
                  <MDBBtn outline floating className="mx-1">
                    <MDBIcon fab icon="twitter" size="lg" />
                  </MDBBtn>
                  <MDBBtn outline floating>
                    <MDBIcon fab icon="skype" size="lg" />
                  </MDBBtn>
                </div>
                <MDBBtn rounded size="lg">
                  Selecionar
                </MDBBtn>
                <div className="d-flex justify-content-between text-center mt-5 mb-2">
                  <div>
                    <MDBCardText className="mb-1 h5">{foundUserOperations.length > 0 ? foundUserOperations[0].current_total : "0"}</MDBCardText>
                    <MDBCardText className="small text-muted mb-0">Saldo Atual</MDBCardText>
                  </div>
                  <div className="px-3">
                    <MDBCardText className="mb-1 h5">8512</MDBCardText>
                    <MDBCardText className="small text-muted mb-0">Operações</MDBCardText>
                  </div>
                  <div>
                    <MDBCardText className="mb-1 h5">{foundUserOperations.length > 0 ? foundUserOperations[0].total_earned : "0"}</MDBCardText>
                    <MDBCardText className="small text-muted mb-0">Transação Total</MDBCardText>
                  </div>
                </div>
              </MDBCardBody>
            </MDBCard>
          </MDBCol>
        </MDBRow>
      </MDBContainer>
    </div>
  );
}