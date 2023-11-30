import { React, lazy } from 'react';
import MainLayout from '../layout/MainLayout';
// import RecycleStatistics from './pages/RecycleStatistics';
// import RecycleMaterials from './pages/RecycleMaterials';
// import CitiesStatistics from '../pages/CitiesStatistics';
import Loadable from '../components/Loadable';
// import Home from './pages/Home';

// utilities routing
const RecycleMaterialsLoad = Loadable(lazy(() => import('../pages/RecycleMaterials')));
const RecycleStatisticsLoad = Loadable(lazy(() => import('../pages/RecycleStatistics')));
const CitiesStatisticsLoad = Loadable(lazy(() => import('../pages/CitiesStatistics')));
const HomeLoad = Loadable(lazy(() => import('../pages/Home')));
const BalanceLoad = Loadable(lazy(() => import('../pages/Balance')));
const UserSearchLoad = Loadable(lazy(() => import('../pages/UserBalanceSearch')));
const AboutUs = Loadable(lazy(() => import('../pages/AboutUs')));
const DashboardLoad = Loadable(lazy(() => import('../pages/dashboard/index')));

// sample page routing
// const SamplePage = Loadable(lazy(() => import('views/sample-page')));

// import RecycleStatistics from './pages/RecycleStatistics';
// import RecycleMaterials from './pages/RecycleMaterials';
// import {BrowserRouter as Router,
//   Route, Routes} from "react-router-dom";
// import Navbar from './components/Navbar';
// import Footer from './components/Footer';
// import Home from './pages/Home';
// import React from 'react';
// import { lazy } from 'react';
// import Loadable from './components/Loadable';
// import CitiesStatistics from './pages/CitiesStatistics';

// ==============================|| MAIN ROUTING ||============================== //

{/* <Route path="/" exact element={<Home/>} />
<Route path="/getmaterials" exact element={<RecycleMaterials />} />
<Route path="/reciclestatistics" exact element={<RecycleStatistics />} />
<Route path="/reciclestatistics/:state" exact element={<CitiesStatistics/>} /> */}

const MainRoutes = {
  path: '/',
  element: <MainLayout />,
  children: [
    {
      path: '',
      element: <HomeLoad />,
    },
    {
      path: 'dashboard',
      element: <DashboardLoad />
    },
    {
      path: 'getmaterials',
      element: <RecycleMaterialsLoad />,
    },
    {
      path: 'reciclestatistics',
      element: <RecycleStatisticsLoad />,
    },
    {
      path: 'reciclestatistics/:state',
      element: <CitiesStatisticsLoad />,
    },
    {
      path: 'balance',
      element: <BalanceLoad />,
    },
    {
      path: 'usersearch',
      element: <UserSearchLoad />,
    },
    {
      path: 'about',
      element: <AboutUs />,
    },
    ]
  }

export default MainRoutes;
