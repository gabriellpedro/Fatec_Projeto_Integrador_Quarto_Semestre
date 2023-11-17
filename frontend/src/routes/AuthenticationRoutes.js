import { lazy, React } from 'react';

// project imports
import Loadable from '../components/Loadable';
import MinimalLayout from '../layout/MinimalLayout';

// login option 3 routing
const AuthLogin = Loadable(lazy(() => import('../pages/authentication/authentication/Login')));
const AuthRegister = Loadable(lazy(() => import('../pages/authentication/authentication/Register')));

// ==============================|| AUTHENTICATION ROUTING ||============================== //



const AuthenticationRoutes = {
  path: '/',
  element: <MinimalLayout />,
  children: [
    {
      path: '/user/login',
      element: <AuthLogin />
    },
    {
      path: '/user/register',
      element: <AuthRegister />
    }
  ]
};

export default AuthenticationRoutes;
