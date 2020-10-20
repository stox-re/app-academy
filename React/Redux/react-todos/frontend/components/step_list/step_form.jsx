import React from 'react';
import { uniqueId } from '../../util';

class StepForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      title: ''
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

    this.props.receiveStep({
      id: uniqueId(),
      title: this.state.title,
      done: false,
      todo_id: this.props.todoId
    });

    this.setState({
      title: ''
    });
  }

  render() {
    return (
      <div className='step-form'>
        <form className='clear-fix'>
          <div className='input-group'>
            <label htmlFor='step-title'>New step</label>
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