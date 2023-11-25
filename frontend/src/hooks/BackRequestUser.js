import UserOccurrenceObj from "../components/UserOccurrence"
import axios from 'axios';


import { React } from 'react';


export function HandleUserSearch({setUserOccurrence, handleUserOccurrenceClick, value=''}) {
    const values = value ? { email: value } : {};
    console.log("Values", values)
    
    localStorage.removeItem('selecteduser');
    localStorage.removeItem('profileseleteduser');
    const URL = 'http://localhost:8000/materials/user_search/';
    axios.get(URL,{
      headers: {
        'content-type': 'application/json',
      },
      params: values,
    })
      .then(response => {
        console.log('Full response:', response); // Log the entire response
        if (response.data) {
          const components = response.data.map((UserOccurrence, key) => (
            <UserOccurrenceObj
              key={key}
              name={UserOccurrence.name}
              user_id={UserOccurrence.id}
              email={UserOccurrence.email}
              is_active={UserOccurrence.is_active}
              onUserOccurrenceClick={() => handleUserOccurrenceClick(UserOccurrence.name)}
            />
    
          ));
          localStorage.setItem('profileseleteduser', JSON.stringify(response.data));
          setUserOccurrence(components);
      };
      })
      .catch(error => {
        console.error('Error fetching user occurrences:', error);
        throw error;
      });
  };
  
  export default HandleUserSearch;