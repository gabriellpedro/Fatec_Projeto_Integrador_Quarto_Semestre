import React from 'react';
import { MDBCol, MDBContainer, MDBRow, MDBCard, MDBCardText, MDBCardBody, MDBCardImage, MDBBtn, MDBTypography, MDBIcon } from 'mdb-react-ui-kit';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

export default function ProfileStatistics() {
    var number = Math.floor(Math.random() * (6 - 1 + 1)) + 1; 
    const avatar = `https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava${number}-bg.webp`
    const storedUserOperations = localStorage.getItem('selecteduser');
    const profileStoredUserOperations = localStorage.getItem('profileseleteduser');
    const navigate = useNavigate();

    console.log('STORAGED', storedUserOperations)
    var foundUserOperations = [];
    var foundProfileUserOperations = [];
    try{
      if (storedUserOperations && profileStoredUserOperations) {
          foundUserOperations = JSON.parse(storedUserOperations);
          foundProfileUserOperations = JSON.parse(profileStoredUserOperations);
          console.log('STORAGED', foundUserOperations[0].current_total )
          console.log('STORAGED PROFILE', foundProfileUserOperations )
        }
    } catch(error){
      console.error('Error parsing storedUserOperations:', error);
    }

    const handleSelectButtonClick = () => {
      const values = { user_id_occurrence: foundProfileUserOperations.length > 0 ? foundProfileUserOperations[0].id  : 0 };
      console.log("Values", values)
      
      localStorage.removeItem('selecteduserbalance');
      const URL = 'http://localhost:8000/materials/recycle_balance/';
      axios.get(URL,{
        headers: {
          'content-type': 'application/json',
        },
        params: values,
      })
        .then(response => {localStorage.setItem('selecteduserbalance', JSON.stringify(response.data))})
        .catch(error => {
          console.error('Error fetching user balance:', error);
          throw error;
        });
        navigate("/balance/");
    };

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
                <MDBTypography tag="h4">{foundProfileUserOperations.length > 0 ? foundProfileUserOperations[0].name : "Ecofriend"}</MDBTypography>
                <MDBCardText className="text-muted mb-4">
                  @{foundProfileUserOperations.length > 0 ? foundProfileUserOperations[0].name : "Ecofriend"} <span className="mx-2">|</span> <a href="#!">{foundProfileUserOperations.length > 0 ? foundProfileUserOperations[0].email : "ecofriend.com"}</a>
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
                <MDBBtn rounded size="lg" onClick={handleSelectButtonClick}>
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