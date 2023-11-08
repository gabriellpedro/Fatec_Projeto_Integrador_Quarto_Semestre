import React from 'react';
import axios from 'axios';
import '../styles/RecycleStatistics.css';

class CitiesStatistics extends React.Component {
  state = {
    cityData: null
  };

  componentDidMount() {
    let data;
    axios
      .get('http://localhost:8000/materials/getstatistics')
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

  renderCityData() {
    const { cityData } = this.state;

    if (cityData) {
      return (
        <div>
          <h1>City Statistics</h1>
          <p>City Name: {cityData.cityName}</p>
          <p>Population: {cityData.population}</p>
          {/* need to render the properties here */}
        </div>
      );
    }

    return <p>Carregando informações das cidades...</p>;
  }

  render() {
    return (
      <div>
        {this.renderCityData()}
      </div>
    );
  }
}

export default CitiesStatistics;
