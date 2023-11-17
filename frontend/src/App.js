// import RecycleStatistics from './pages/RecycleStatistics';
// import RecycleMaterials from './pages/RecycleMaterials';
// import {BrowserRouter as Router,
//   Route, Routes} from "react-router-dom";
// import {BrowserRouter as Router} from "react-router-dom";
// import Navbar from './components/Navbar';
import Footer from './components/Footer';
// import Home from './pages/Home';
// import { lazy } from 'react';
// import Loadable from './components/Loadable';
// import CitiesStatistics from './pages/CitiesStatistics';
import { CssBaseline, StyledEngineProvider } from '@mui/material';
import NavigationScroll from './layout/NavigationScroll';
import { ThemeProvider } from '@mui/material/styles';
import themes from './themes';
import React from 'react';
// import Login from './pages/authentication/authentication/Login'
// import Register from './pages/authentication/authentication/Register'

// const AuthLogin = Loadable(lazy(() => import('./pages/authentication/authentication/Login')));
// const AuthRegister = Loadable(lazy(() => import('./pages/authentication/authentication/Register')));
// import AuthenticationRoutes from './routes/AuthenticationRoutes';
import Routes from './routes';
import { useSelector } from 'react-redux';

// const App = () => {
  // const customization = useSelector((state) => state.customization);
  //   return (
  //     <StyledEngineProvider injectFirst>
  //       <CssBaseline />
        
  //       {/* <div className='App'>
  //         <Navbar />
  //             {/* <Routes>
  //               <AuthenticationRoutes />
  //               <Route path="/" exact element={<Home/>} />
  //               <Route path="/getmaterials" exact element={<RecycleMaterials />} />
  //               <Route path="/reciclestatistics" exact element={<RecycleStatistics />} />
  //               <Route path="/reciclestatistics/:state" exact element={<CitiesStatistics/>} />
  //               <Route path="/user/login" exact element={<AuthLogin/>} />
  //               <Route path="/user/register" exact element={<AuthRegister/>} />
  //             </Routes> */}
  //       <ThemeProvider theme={themes(customization)}>
  //         <NavigationScroll>
  //           <Routes />
  //         </NavigationScroll>
  //       </ThemeProvider>
  //       {/* <Footer /> */}
  //         {/* </div> */}
  //     </StyledEngineProvider>
  //   );
  // };

const App = () => {
  const customization = useSelector((state) => state.customization);

  return (
    <StyledEngineProvider injectFirst>
      <ThemeProvider theme={themes(customization)}>
        <CssBaseline />
        <NavigationScroll>
          <Routes />
        </NavigationScroll>
        <Footer />
      </ThemeProvider>
    </StyledEngineProvider>
  );
};

export default App;


