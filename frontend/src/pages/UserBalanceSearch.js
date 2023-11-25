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
  import BalanceOccurrenceSmall from "../components/BalanceOccurrenceSmall"
  import Logo from '../assets/logo.png';
  import SearchMaterial from '../layout/MainLayout/Header/SearchSection/SearchMaterial';
  // import * as BackRequests from '../hooks/BackRequests';
  import HandleUserSearch from '../hooks/BackRequestUser';
  import ProfileStatistics from '../components/UserSearchProfile'



function Balance() {
  
  const [userOccurrence, setUserOccurrence] = useState([]);
  const [searchResult, setSearchResult] = useState(null);
  const [isComponentMounted, setIsComponentMounted] = useState(false);
  const [refreshCounter, setRefreshCounter] = useState(0);

  const handleUserOccurrenceClick = (user) => {
    // Handle the click event and state change here
    console.log('User occurrence clicked:', user);
    setRefreshCounter((prevCounter) => prevCounter + 1);
  };


  useEffect(() => {
    const fetchData = async () => {
      if (!isComponentMounted) {
        // Call HandleUserSearch on the initial render
        setIsComponentMounted(true);
        await HandleUserSearch({ setUserOccurrence, handleUserOccurrenceClick, value: ''});
      } else if (searchResult !== null) {
        await HandleUserSearch({ setUserOccurrence, handleUserOccurrenceClick, value: searchResult });
      }
    };

    fetchData();
  }, [isComponentMounted, searchResult]);

  console.log('searchResult', searchResult)
  const updateSearchResult = (result) => {
    setSearchResult(result);
  }


  const handleRefresh = () => {
    // Increment the counter to trigger a re-render in ChildComponent
    setRefreshCounter((prevCounter) => prevCounter + 1);
  };

  return (
  <section className="h-85 h-custom" style={{ backgroundColor: "#eee" }}>
    <MDBContainer className="py-3 h-80">
      <MDBRow className="justify-content-center align-items-center h-80">
        <MDBCol>
          <MDBCard>
            <MDBCardBody className="p-2">
              <MDBRow>
                <MDBCol lg="7" style={{ overflowY: 'auto', maxHeight: '500px' }}>
                  <MDBTypography tag="h5">
                    <SearchMaterial onUpdateValue={updateSearchResult}/>
                  </MDBTypography>
                  <hr />
                  <div className="d-flex justify-content-between align-items-center mb-4">
                    <div>
                      <p className="mb-1">Usuário</p>
                    </div>
                    <div>
                      <p>
                        <span className="text-muted">Busca por:</span>
                        <a href="#!" className="text-body">
                          Email
                          <MDBIcon fas icon="angle-down mt-1" />
                        </a>
                      </p>
                    </div>
                  </div>
                  {userOccurrence}
                </MDBCol>
                <MDBCol lg="5">
                  <ProfileStatistics />
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