import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ''
    };

    this.setInputVal = this.setInputVal.bind(this);
    this.handleClickName = this.handleClickName.bind(this);
  }

  setInputVal(event) {
    this.setState({
      inputVal: event.target.value
    });
  }

  handleClickName(event) {
    event.preventDefault();
    this.setState({
      inputVal: event.target.innerHTML
    });
  }

  render() {
    let namesToDisplay = [];
    this.props.listOfNames.forEach((name, index) => {
      if (name.toLowerCase().startsWith(this.state.inputVal.toLowerCase())) {
        namesToDisplay.push(<li key={index} onClick={this.handleClickName}>{name}</li>)
      }
    });

    return (
      <div className='autocomplete'>
        <h1>Autocomplete List</h1>
        <input type='text' value={this.state.inputVal} onChange={this.setInputVal}></input>
        <ul>
          {namesToDisplay}
        </ul>
      </div>
    )
  }
}

export default Autocomplete;