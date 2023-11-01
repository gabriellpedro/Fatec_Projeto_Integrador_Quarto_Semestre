import StateOccurrence from '../components/StateOccurrence'
import "../styles/RecycleStatistics.css";
import React from 'react';
import axios from 'axios';

class RecycleStatistics extends React.Component {
    state = { details: [], };

    componentDidMount(){
        let data;
        axios.get('http://localhost:8000/materials/getstatistics')
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
            <div className="states">
                <h1 className="statesTitle"> Reciclagem por Estado 2020/2021 </h1>
                <div className="stateList">
                    {this.state.details.map((stateOccurrence, key) => {
                        return (
                            <StateOccurrence
                                key={key}
                                state={stateOccurrence.state}
                                paper={stateOccurrence.paper}
                                steel={stateOccurrence.steel}
                                glass={stateOccurrence.glass}
                                cooperatives={stateOccurrence.cooperatives}
                            />
                        );
                    })}
                </div>
            </div>
        );
    };
}

export default RecycleStatistics;
