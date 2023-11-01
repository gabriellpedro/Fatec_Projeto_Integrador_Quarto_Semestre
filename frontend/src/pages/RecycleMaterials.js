import MaterialOccurrence from '../components/MaterialOccurrence'
import "../styles/RecycleMaterials.css";
import React from 'react';
import axios from 'axios';

class RecycleMaterials extends React.Component {
    state = { details: [], };

    componentDidMount(){
        let data;
        axios.get('http://localhost:8000/materials/getmaterials')
            .then(res => {
                data = res.data;
                this.setState({
                    details: data
                });
            })
            .catch(err=> { console.error("Error fetching data:", err); });
    };

    render(){
        return (
            <div className="materials">
                <h1 className="materialsTitle"> Materiais Recicláveis </h1>
                <div className="materialsList">
                    {this.state.details.map((MaterialsOccurrence, key) => {
                        return (
                            <MaterialOccurrence
                                key={key}
                                name={MaterialsOccurrence.name}
                                price={MaterialsOccurrence.price}
                                mesure_unity={MaterialsOccurrence.mesure_unity}
                            />
                        );
                    })}
                </div>
            </div>
        );
    };
}

export default RecycleMaterials;
