
import axios from 'axios';


export async function HandleUserDashboard(setUserDashboard, userData) {
    try {
        console.log('USER::', userData)
        const balanceValues = { user_id_occurrence: userData.user_id };
        console.log("Operation Values", balanceValues);

        localStorage.removeItem('useroperations');
        const balanceURL = 'http://localhost:8000/materials/operation/';
        const operationResponse = await axios.get(balanceURL, {
            headers: {
                'Content-Type': 'application/json',
            },
            params: balanceValues,
        });

        localStorage.setItem('useroperations', JSON.stringify(operationResponse.data));
        console.log('RESPONSE OPERATION', operationResponse.data)
        if (operationResponse.data.length == 1){
            setUserDashboard(operationResponse.data[0])
        }
    } catch (error) {
        console.error('Error fetching user occurrences:', error);
    }
}

export default HandleUserDashboard;