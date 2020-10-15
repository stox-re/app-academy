import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {
    var options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    navigator.geolocation.getCurrentPosition(this.currentWeatherLookup.bind(this), this.currentPositionError.bind(this), options);
  }

  currentWeatherLookup(pos) {
    const self = this;

    var request = new XMLHttpRequest();
    request.open('GET', `https://api.openweathermap.org/data/2.5/weather?units=metric&lat=${pos.coords.latitude}&lon=${pos.coords.longitude}&appid=${process.env.REACT_APP_WEATHER_API_KEY}`, true);

    request.onload = function () {
      if (this.status >= 200 && this.status < 400) {
        var resp = JSON.parse(this.response);
        self.setState({
          weather: resp
        });
      } else {
        console.log(this);
      }
    };

    request.onerror = function () {};
    request.send();
  }

  currentPositionError(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }

  render() {
    let weatherData = <h2>Loading weather...</h2>;
    let thisWeather = this.state.weather;

    if (typeof thisWeather != 'undefined') {
      weatherData =
      <div>
        <div className='weather-header'>
          <h2>Weather in {thisWeather['name']}</h2>
          <img src={`http://openweathermap.org/img/wn/${thisWeather.weather[0].icon}.png`}></img>
        </div>
        <ul>
          <li>{thisWeather['weather'][0]['description']}</li>
          <li>Feels like {thisWeather['main']['feels_like']} °C</li>
          <li>Temperature of {thisWeather['main']['temp']} °C</li>
        </ul>
      </div>;
    }

    return (
      <div className='weather'>
        {weatherData}
      </div>
    )
  }
}

export default Weather;