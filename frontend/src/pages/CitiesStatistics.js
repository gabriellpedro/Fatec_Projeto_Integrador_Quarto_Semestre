import React from 'react';
import axios from 'axios';
import '../styles/CitysOccurrences.css';
import withRouter from '../components/Hoc';
import CityOccurrence from '../components/CityOccurrence'

class CitiesStatistics extends React.Component {
  state = { details: [], };

  // ParamsUsed = () => {
  //     const params = useParams();
  //     return params
  // }

  componentDidMount() {
    // let params = this.ParamsUsed();
    let data;
    axios
      .get(`http://localhost:8000/materials/reciclestatistics/${this.props.params.state}`)
      .then((res) => {
        data = res.data;
        this.setState({
          details: data,
        });
      })
      .catch((err) => {
        console.error('Error fetching data:', err);
      });
  }

  render() {
      return (
        <div className="citys">
            <h1 className="citysTitle"> Recicláveis da cidade de {this.props.params.state} </h1>
            <div className="citysList">
                {this.state.details.map((CitysOccurrence, key) => {
                    return (
                        <CityOccurrence
                          key={key}
                          city={CitysOccurrence.city}
                          state={CitysOccurrence.state}
                          plastic={CitysOccurrence.plastic}
                          paper={CitysOccurrence.paper}
                          steel={CitysOccurrence.steel}
                          glass={CitysOccurrence.glass}
                          cooperatives={CitysOccurrence.cooperatives}
                        />
                    );
                })}
            </div>
        </div>
    );
  };
};




//   renderCityData() {
//     const { cityData } = this.state;

//     if (cityData) {
//       return (
//         <div>
//           <h1>City Statistics</h1>
//           <p>City Name: {cityData.cityName}</p>
//           <p>Population: {cityData.population}</p>
//           {/* need to render the properties here */}
//         </div>
//       );
//     }

//     return <p>Carregando informações das cidades...</p>;
//   }

//   render() {
//     return (
//       <div>
//         {this.renderCityData()}
//       </div>
//     );
//   }
// }

export default withRouter(CitiesStatistics);
