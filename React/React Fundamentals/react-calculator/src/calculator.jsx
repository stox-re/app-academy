import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: '',
      num2: ''
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clearFields = this.clearFields.bind(this);
  }

  setNum1(e) {
    this.setState({
      num1: parseFloat(e.target.value)
    });
  }

  setNum2(e) {
    this.setState({
      num2: parseFloat(e.target.value)
    });
  }

  add(e) {
    e.preventDefault();
    this.setState({
      result: this.state.num1 + this.state.num2
    });
  }

  subtract(e) {
    e.preventDefault();
    this.setState({
      result: this.state.num1 - this.state.num2
    });
  }

  multiply(e) {
    e.preventDefault();
    this.setState({
      result: this.state.num1 * this.state.num2
    });
  }

  divide(e) {
    e.preventDefault();
    this.setState({
      result: this.state.num1 / this.state.num2
    });
  }

  clearFields(e) {
    e.preventDefault();
    this.setState({
      result: 0,
      num1: '',
      num2: ''
    });
  }

  render() {
    const {result, num1, num2 } = this.state;

    return (
      <div>
        <h1>{result}</h1>
        <input type='text' value={num1} onChange={this.setNum1}/>
        <input type='text' value={num2} onChange={this.setNum2} />
        <br></br>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.clearFields}>Clear</button>
      </div>
    );
  }
}

export default Calculator;