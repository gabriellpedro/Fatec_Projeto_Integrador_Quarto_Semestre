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
  import {React, useState, useEffect} from "react";
  import 'mdb-react-ui-kit/dist/css/mdb.min.css';
  // import GenericProduct from "../assets/images/icons/generic_product.avif"
  import BalanceOccurrence from "../components/BalanceOccurrence"
  import BalanceOccurrenceSmall from "../components/BalanceOccurrenceSmall"
  import Logo from '../assets/logo.png';
  import SearchSection from '../layout/MainLayout/Header/SearchSection/index';
  import SearchMaterial from '../layout/MainLayout/Header/SearchSection/SearchMaterial';
  // import * as BackRequests from '../hooks/BackRequests';
  import HandleMaterials from '../hooks/BackRequests';
  import HandleUserBalance from '../hooks/BackRequestUserBalance';
  import HandleBalanceClose from "../hooks/CloseBalanceOccurrence"
  import Typography from '@mui/material/Typography';
  import { useNavigate } from 'react-router-dom';
  import Modal from '@mui/material/Modal';
  import Box from '@mui/material/Box';

function Balance() {

  const [materialComponents, setMaterialComponents] = useState([]);
  const [searchResult, setSearchResult] = useState(null);
  const [isComponentMounted, setIsComponentMounted] = useState(false);
  const [operationsBalance, setoperationsBalance] = useState([]);
  const storedUserOperations = localStorage.getItem('selecteduser');
  const profileStoredUserOperations = localStorage.getItem('profileseleteduser');
  const storedUserOperationsBalance = localStorage.getItem('selecteduserbalance');
  const [refreshBalance, setrefreshBalance] = useState(false);
  const [open, setOpen] = useState(false);
  const navigate = useNavigate();

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

  var foundUserOperations = [];
  var foundProfileUserOperations = [];
  var foundUserOperationsBalance = [];

  try{
    if (storedUserOperations && profileStoredUserOperations) {
        foundUserOperations = JSON.parse(storedUserOperations);
        foundProfileUserOperations = JSON.parse(profileStoredUserOperations);
        console.log('STORAGED', foundUserOperations[0].current_total )
        console.log('STORAGED PROFILE', foundProfileUserOperations )
        if (foundUserOperations.length > 0 && foundProfileUserOperations.length > 0){
          foundUserOperations = foundUserOperations[0];
          foundProfileUserOperations = foundProfileUserOperations[0];
        }
      };
  } catch(error){
    console.error('Error parsing storedUserOperations:', error);
  };

  try{
    if (storedUserOperationsBalance) {
        foundUserOperationsBalance = JSON.parse(storedUserOperationsBalance);
      }
    } catch(error){
        console.error('Error parsing storedUserOperations:', error);
      };
    const handleOpen = () => {
        setOpen(true);
    };
    const handleClose = (event) => {
        setOpen(false);
        event.stopPropagation();
    };


  const HandleBalanceCloseClick = (event) => {
      if (foundProfileUserOperations.id){
        HandleBalanceClose(foundProfileUserOperations.id);
        setOpen(false);
        navigate("/usersearch/")
      }
      event.stopPropagation();
  }

  useEffect(() => {

    const RefreshBalance = () => {
      if(refreshBalance){
        setrefreshBalance(false)
      } else {
        setrefreshBalance(true)
      }
      fetchData();
    }

    const fetchData = async () => {
      if (!isComponentMounted) {
        // Call HandleMaterials on the initial render
        setIsComponentMounted(true);
        await HandleMaterials({RefreshBalance,  setMaterialComponents, value: ''});
        await HandleUserBalance(setoperationsBalance);
      } else if (searchResult !== null) {
        await HandleMaterials({ RefreshBalance, setMaterialComponents, value: searchResult });
        await HandleUserBalance(setoperationsBalance);
      }
    };

    fetchData();
  }, [isComponentMounted, searchResult, setoperationsBalance, refreshBalance]);

  console.log('searchResult', searchResult)
  const updateSearchResult = (result) => {
    setSearchResult(result);
  }

  const HandleClick = () =>{
    navigate("/usersearch/");
  }

  return (
  <section className="h-85 h-custom" style={{ backgroundColor: "#eee" }}>
    <MDBContainer className="py-3 h-80">
      <MDBRow className="justify-content-center align-items-center h-80">
        <MDBCol>
          <MDBCard>
            <MDBCardBody className="p-2">
              <MDBRow>
                <MDBCol lg="7" style={{ overflowY: 'auto', maxHeight: '500px' }}>
                  <MDBTypography tag="h5" className="d-flex align-items-center">
                    {/* <a href="#!" className="text-body">
                      <MDBIcon fas icon="long-arrow-alt-left me-2" /> Continue
                      shopping
                    </a> */}
                    <SearchMaterial onUpdateValue={updateSearchResult}/>
                    <MDBBtn color="info" block size="lg" className="ms-5" onClick={HandleClick}>
                        Alterar Usuário
                    </MDBBtn>
                  </MDBTypography>
                  <hr />
                  <div className="d-flex justify-content-between align-items-center mb-4">
                    <div>
                      <p className="mb-1">Balança atual, usuário {foundProfileUserOperations.name ? foundProfileUserOperations.name : "Indefinido"}</p>
                      <p className="mb-0">Há {operationsBalance.length} item{operationsBalance.length > 1 ? "s" : ""} na balança desse cliente</p>
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
                {/* <HandleMaterials setMaterialComponents={setMaterialComponents} onUpdateSearchResult={UpdateMaterials}/> */}
                  {materialComponents}
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

                      <MDBCol lg="12" style={{ overflowY: 'auto', maxHeight: '200px' }}>
                          {operationsBalance.length > 0 ? operationsBalance : "Usuário não possui lista ativa" }
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
                      <hr />

                      <div className="d-flex justify-content-between">
                        <p className="mb-2">Quantidade de Materiais</p>
                        <p className="mb-2">{operationsBalance.length}</p>
                      </div>

                      <div className="d-flex justify-content-between">
                        <p className="mb-2">Subtotal</p>
                        <p className="mb-2">R$ {foundUserOperationsBalance.length > 0 ? foundUserOperationsBalance[0].final_value : 0}</p>
                      </div>

                      <div className="d-flex justify-content-between">
                        <p className="mb-2">Impostos </p>
                        <p className="mb-2">- R$ 0</p>
                      </div>
  
                      <div className="d-flex justify-content-between">
                        <p className="mb-2">Total</p>
                        <p className="mb-2">R$ {foundUserOperationsBalance.length > 0 ? foundUserOperationsBalance[0].final_value : 0}</p>
                      </div>
  
                      <MDBBtn color="info" block size="lg" onClick={handleOpen}>
                        <div className="d-flex justify-content-between">
                          <span>$ {foundUserOperationsBalance.length > 0 ? foundUserOperationsBalance[0].final_value : 0}</span>
                          <span>
                            Fechar {" "}
                            <i className="fas fa-long-arrow-alt-right ms-2"></i>
                          </span>
                        </div>
                        <Modal
                          open={open}
                          onClose={handleClose}
                          aria-labelledby="modal-modal-material"
                          aria-describedby="modal-modal-description"
                      >
                          <Box sx={style}>
                          <Typography variant="h4" component="h2" gutterBottom>
                                      Fechamento de lista de usuário
                          </Typography>
                          <Typography variant="h4" component="h2" gutterBottom>
                                      {foundProfileUserOperations && foundProfileUserOperations.id ? `Para usuário: ${foundProfileUserOperations.name}` : "Não há usuário selecionado"}
                          </Typography>
                          <Typography variant="body2" color="error" gutterBottom>
                              Esta operação não poderá ser desfeita!
                          </Typography>
                          <div style={{ display: 'flex', justifyContent: 'space-between'}}>
                              <MDBBtn color="danger" size="sl" className="ms-11" onClick={(event) => handleClose(event)}>
                                          Cancelar
                              </MDBBtn>
                              <MDBBtn color="success" size="sl" className="ms-11" onClick={(event) => HandleBalanceCloseClick(event)}>
                                          Fechar
                              </MDBBtn>
                          </div>
                          </Box>
                      </Modal>
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
};


export default Balance;