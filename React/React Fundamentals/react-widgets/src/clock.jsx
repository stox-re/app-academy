import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      date: new Date(Date.now())
    }
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.timerHandle = setInterval(() => {
      this.tick();
    }, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.timerHandle);
    this.timerHandle = 0;
  }

  tick() {
    this.setState({
      date: new Date()
    });
  }

  renderHours() {
    return this.renderZero(this.state.date.getHours());
  }

  renderMinutes() {
    return this.renderZero(this.state.date.getMinutes());
  }

  renderSeconds() {
    return this.renderZero(this.state.date.getSeconds());
  }

  renderDate() {
    return this.state.date.toDateString();
  }

  renderZero(timeItem) {
    if (timeItem < 10) {
      return `0${timeItem}`;
    } else {
      return timeItem;
    }
  }

  render() {
    return (
      <div className='clock'>
        <div className='time-clock padding-bottom'>
          <h1>Time:</h1>
          <div className='time'>
            <span>{this.renderHours()}</span>:
            <span>{this.renderMinutes()}</span>:
            <span>{this.renderSeconds()}</span>
          </div>
        </div>
        <div className='time-clock'>
          <h1>Date:</h1>
          <div className='time'>
            <span>{this.renderDate()}</span>
          </div>
        </div>
      </div>
    )
  }
}

export default Clock;