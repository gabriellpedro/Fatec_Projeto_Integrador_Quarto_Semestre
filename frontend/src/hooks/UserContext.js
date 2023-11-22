import React, { createContext, useContext, useState, useEffect } from 'react';

const UserContext = createContext();

export const UserProvider = ({ children }) => {
  const [userData, setUserData] = useState(null);

  useEffect(() => {
    const fetchUserFromLocalStorage = () => {
      try {
        // Check local storage for a storedUser
        const storedUser = localStorage.getItem('user');
        if (storedUser) {
          const foundUser = JSON.parse(storedUser);
          setUserData(foundUser);
        }
      } catch (error) {
        console.error('Error fetching user from local storage:', error);
      }
    };

    fetchUserFromLocalStorage();
  }, []);

  const setUser = (data) => {
    setUserData(data);
  };

  const logout = () => {
    // Add any additional logic for logout, e.g., clearing local storage
    setUserData(null);
    localStorage.removeItem('user');
  };

  return (
    <UserContext.Provider value={{ userData, setUser, logout }}>
      {children}
    </UserContext.Provider>
  );
};

export const useUser = () => {
  return useContext(UserContext);
};