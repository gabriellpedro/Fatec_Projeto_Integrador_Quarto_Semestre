import BalanceOccurrenceSmall from "../components/BalanceOccurrenceSmall"
import { React } from 'react';


async function HandleUserBalance(setoperationsBalance) {
  const storedUserOperationsBalance = localStorage.getItem('selecteduserbalance');
  console.log("In the handle balance component")
  var foundUserOperationsBalance = [];

    try{
      if (storedUserOperationsBalance) {
          foundUserOperationsBalance = JSON.parse(storedUserOperationsBalance);

          console.log('STORAGED BALANCE', foundUserOperationsBalance )
          if (foundUserOperationsBalance.length > 0){
            foundUserOperationsBalance = foundUserOperationsBalance[0];
            if (foundUserOperationsBalance.recicle_balance_array.length > 0){
              console.log(foundUserOperationsBalance.recicle_balance_array[0].mesure)
              const operationsBalance = foundUserOperationsBalance.recicle_balance_array.map((balanceOccurrence, key) => (
                <BalanceOccurrenceSmall
                  key={key}
                  name={balanceOccurrence.name}
                  mesure={balanceOccurrence.mesure}
                  price={balanceOccurrence.price}
                  mesure_unity={balanceOccurrence.mesure_unity}/>
              ));
              setoperationsBalance(operationsBalance);
            }
          }
        };
    } catch(error){
      console.error('Error parsing storedUserOperations:', error);
    }
  };
  
export default HandleUserBalance;
