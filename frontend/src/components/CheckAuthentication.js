import { useUser } from '../hooks/UserContext';
import { useEffect, useCallback } from 'react';

const CheckUserAuthentication = () => {
  const { setUser } = useUser();

  useEffect(() => {

  }, [setUser]);

  return null;
};

export default CheckUserAuthentication;

