import GenericProduct from "../assets/images/icons/generic_product.avif"
import Typography from '@mui/material/Typography';
import TextField from '@mui/material/TextField';
import { useNavigate } from 'react-router-dom';
import { React, useState } from 'react';
// import MesureModal from "../components/ModalAddMesure"
import Modal from '@mui/material/Modal';
import Box from '@mui/material/Box';
import HandleAddOccurrenceToBalance from '../hooks/AddOccurrenceToBalance'
import {
    MDBBtn,
    MDBCard,
    MDBCardBody,
    MDBCardImage,
    MDBIcon,
    MDBTypography,
    } from "mdb-react-ui-kit";
    
function BalanceOccurrence({ RefreshBalance, id, name, mesure, price, mesure_unity }) {
    const [open, setOpen] = useState(false);
    const [mesureAdded, setMesureAdded] = useState('');
    const [isValidMesure, setIsValidMesure] = useState(true);
    const handleOpen = () => {
        setOpen(true);
    };
    const handleClose = (event) => {
        setOpen(false);
        event.stopPropagation();
    };

    const handleAddOccurrence = (event) => {
        if (validateMesure()) {
            console.log('Quantidade is valid:', mesureAdded);
            setOpen(false);
            if (foundProfileUserOperations.length > 0 && foundProfileUserOperations[0].id){
                var user_id = foundProfileUserOperations[0].id
                console.log("Material ID", id)
                console.log("User ID", user_id)
                console.log("Mesure", mesureAdded)
                HandleAddOccurrenceToBalance(id, user_id, mesureAdded)
                .then(() => {
                    RefreshBalance();
                  })
                  .catch((error) => {
                    console.error('Error adding occurrence to balance:', error);
                  });
            }
            event.stopPropagation();
        }   };


    const validateMesure = () => {
        const numericRegex = /^[+-]?([0-9]*[.])?[0-9]+$/;

        const isValid = numericRegex.test(mesureAdded);
        setIsValidMesure(isValid);
        return isValid;
    };

    const style = {
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        width: 400,
        bgcolor: 'background.paper',
        border: '2px solid #000',
        boxShadow: 24,
        p: 4,
    };

    const profileStoredUserOperations = localStorage.getItem('profileseleteduser');

    var foundProfileUserOperations = [];
  
    try{
      if (profileStoredUserOperations) {
          foundProfileUserOperations = JSON.parse(profileStoredUserOperations);
          console.log('STORAGED PROFILE', foundProfileUserOperations )
        };
    } catch(error){
      console.error('Error parsing storedUserOperations:', error);
    };


    return (
        <MDBCard className="mb-3" style={{ pointerEvents: 'auto', cursor: 'pointer' }} onClick={handleOpen}>
            <MDBCardBody>
            <div className="d-flex justify-content-between">
                <div className="d-flex flex-row align-items-center">
                <div>
                    <MDBCardImage
                    src={GenericProduct}
                    fluid className="rounded-3" style={{ width: "65px" }}
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
                <div style={{ width: "80px" }}>
                    <MDBTypography tag="h5" className="mb-0">
                    R$ {price}
                    </MDBTypography>
                </div>
                <a href="#!" style={{ color: "#cecece" }}>
                    <MDBIcon fas icon="trash-alt" />
                </a>
                </div>
            </div>

            <Modal
                open={open}
                onClose={handleClose}
                aria-labelledby="modal-modal-material"
                aria-describedby="modal-modal-description"
            >
                <Box sx={style}>
                <Typography variant="h4" component="h2" gutterBottom>
                            Adição de material: {name}
                </Typography>
                <Typography variant="h4" component="h2" gutterBottom>
                            {foundProfileUserOperations.length > 0 && foundProfileUserOperations[0].id ? `Para usuário: ${foundProfileUserOperations[0].name}` : "Não há usuário selecionado"}
                </Typography>
                <TextField
                    label="Quantidade"
                    variant="outlined"
                    fullWidth
                    margin="normal"
                    value={mesureAdded}
                    onChange={(e) => setMesureAdded(e.target.value)}
                    error={!isValidMesure}
                    helperText={!isValidMesure && 'Quantidade deve ser um valor númerico.'}
                />
                <Typography variant="body2" color="error" gutterBottom>
                    {foundProfileUserOperations.length > 0 && foundProfileUserOperations[0].id ? `Lembre-se que a unidade de medida desse produto é ${mesure_unity}` : "Não há usuário selecionado"}
                </Typography>
                <div style={{ display: 'flex', justifyContent: 'space-between'}}>
                    <MDBBtn color="danger" size="sl" className="ms-11" onClick={(event) => handleClose(event)}>
                                Cancelar
                    </MDBBtn>
                    <MDBBtn color="success" size="sl" className="ms-11" onClick={(event) => handleAddOccurrence(event)}>
                                Adicionar
                    </MDBBtn>
                </div>
                </Box>
            </Modal>
            </MDBCardBody>
    </MDBCard>

    )

}

export default BalanceOccurrence;
