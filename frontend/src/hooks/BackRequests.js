import BalanceOccurrence from "../components/BalanceOccurrence"
import axios from 'axios';


import { React } from 'react';


export async function HandleMaterials({setMaterialComponents, value='pressor'}) {
  const values = value ? { material_search: value } : {};
  console.log("Values", values)
  const URL = 'http://localhost:8000/materials/getmaterials/';
  await axios.get(URL,{
    headers: {
      'content-type': 'application/json',
    },
    params: values,
  })
    .then(response => {
      console.log('Full response:', response); // Log the entire response
      if (response.data) {
        const components = response.data.map((materialOccurrence, key) => (
          <BalanceOccurrence
            key={key}
            name={materialOccurrence.name}
            price={materialOccurrence.price}
            mesure="0"
            mesure_unity={materialOccurrence.mesure_unity}
          />
  
        ));
        setMaterialComponents(components);
    };
    })
    .catch(error => {
      throw error;
    });
};

export default HandleMaterials;