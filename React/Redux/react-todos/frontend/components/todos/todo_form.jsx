import React from 'react';
import { receiveTodo } from '../../actions/todo_actions';
import { uniqueId } from '../../util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      title: '',
      body: ''
    };

    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleTitleChange(event) {
    this.setState({
      title: event.target.value
    })
  }

  handleBodyChange(event) {
    this.setState({
      body: event.target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.receiveTodo({
      id: uniqueId(),
      title: this.state.title,
      body: this.state.body,
      done: false
    });

    this.setState({
      title: '',
      body: ''
    })
  }

  render() {
    return (
      <div className='todo-form'>
        <h3>Add New Todo</h3>
        <form className='clear-fix'>
          <div className='input-group'>
            <label htmlFor='todo-title'>Title</label>
            <input onChange={this.handleTitleChange} id='todo-title' type='text' value={this.state.title} placeholder='Enter your title...'></input>
          </div>
          <div className='input-group'>
            <label htmlFor='todo-body'>Body</label>
            <input onChange={this.handleBodyChange} id='todo-body' type='text' value={this.state.body} placeholder='Enter the body of your todo...'></input>
          </div>
          <div className='button-group'>
            <button onClick={this.handleSubmit} type='submit'>Submit</button>
          </div>
        </form>
      </div>
    )
  }
}

export default TodoForm;