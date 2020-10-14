import React from 'react';

class ClickCounter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  click(event) {
    event.preventDefault();
    this.setState({
      count: this.state.count + 1
    });
  }

  render() {
    return (
      <div>
        <button onClick={this.click.bind(this)}>Click Me!</button>
        <span>{this.state.count}</span>
      </div>
    )
  }
}

export default ClickCounter;