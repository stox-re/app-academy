import React from 'react';

class StepForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      title: '',
      body: ''
    };

    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleTitleChange(event) {
    this.setState({
      title: event.target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    let newStep = {
      title: event.target.title,
      done: false,
    }
  }

  render() {
    return (
      <div className='step-form'>
        <h3>Add New Todo</h3>
        <form className='clear-fix'>
          <div className='input-group'>
            <label htmlFor='step-title'>Title</label>
            <input onChange={this.handleTitleChange} name='step-title' type='text' value={this.state.title} placeholder='Enter your step title...'></input>
          </div>
          <div className='button-group'>
            <button onClick={this.handleSubmit} type='submit'>New Step</button>
          </div>
        </form>
      </div>
    )
  }
}

export default StepForm;