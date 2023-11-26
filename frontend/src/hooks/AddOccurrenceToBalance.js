import axios from 'axios';


export function HandleAddOccurrenceToBalance(material_id, user_id, mesure) {
    return new Promise( async (resolve, reject) => {
        const values = {
            "user_id_occurrence": user_id,
            "material_id": material_id,
            "mesure": mesure,
        };

        console.log("Values", values);

        const URL = 'http://localhost:8000/materials/recycle_balance/add_occurrence';

        try {
            const response = await axios.post(URL, values, {
                headers: {
                    'Content-Type': 'application/json',
                },
            });

            console.log('Full response:', response); // Log the entire response

            const balanceValues = { user_id_occurrence: user_id };
            console.log("Balance Values", balanceValues);

            localStorage.removeItem('selecteduserbalance');
            const balanceURL = 'http://localhost:8000/materials/recycle_balance/';
            const balanceResponse = await axios.get(balanceURL, {
                headers: {
                    'Content-Type': 'application/json',
                },
                params: balanceValues,
            });

            localStorage.setItem('selecteduserbalance', JSON.stringify(balanceResponse.data));
            resolve();
        } catch (error) {
            console.error('Error fetching user occurrences:', error);
            reject(error);
        }
    });
};
  
  export default HandleAddOccurrenceToBalance;
