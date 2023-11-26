import * as React from 'react';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Modal from '@mui/material/Modal';
import {
    MDBBtn,
    MDBCard,
    MDBCardBody,
    MDBCardImage,
    MDBIcon,
    MDBTypography,
    } from "mdb-react-ui-kit";

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

export default function MesureModal({open, setOpen}) {
    // const handleOpen = () => setOpen(true);
    const handleClose = () => {
        console.log("TRYING TO CLOSE HERE")
        setOpen(false);
    };
    return (
    <div>
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
                <TextField
                    label="Quantidade"
                    variant="outlined"
                    fullWidth
                    margin="normal"
                />
                <Typography variant="body2" color="error" gutterBottom>
                    Lembre-se que a unidade de medida desse produto é {mesure_unity}
                </Typography>
                <div style={{ display: 'flex', justifyContent: 'space-between'}}>
                    <MDBBtn color="danger" size="sl" className="ms-11" onClick={(event) => handleClose(event)}>
                                Cancelar
                    </MDBBtn>
                    <MDBBtn color="success" size="sl" className="ms-11" onClick={(event) => handleClose(event)}>
                                Adicionar
                    </MDBBtn>
                </div>
                </Box>
            </Modal>
        </div>
    );
}