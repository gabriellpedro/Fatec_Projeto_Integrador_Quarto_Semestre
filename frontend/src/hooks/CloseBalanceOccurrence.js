import axios from 'axios';


export async function HandleBalanceClose(user_id) {
        const values = {
            "user_id_occurrence": user_id,
        };

        console.log("Values", values);

        const URL = 'http://localhost:8000/materials/recycle_balance/close';

        try {
            const response = await axios.post(URL, values, {
                headers: {
                    'Content-Type': 'application/json',
                },
            });

            console.log('Full response:', response);
        } catch (error) {
            console.error('Error fetching closing balance:', error);
            reject(error);
        }
    };
  
  export default HandleBalanceClose;
