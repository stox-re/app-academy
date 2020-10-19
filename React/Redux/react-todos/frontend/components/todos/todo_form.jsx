import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
    console.log("todo form props");
    console.log(props);
  }

  render() {
    return (
      <div className='todo-form'>
        <h3>Add New Todo</h3>
        <form>
          <div className='input-group'>
            <label htmlFor='todo-title'>Title</label>
            <input id='todo-title' type='text'></input>
          </div>
          <div className='input-group'>
            <label htmlFor='todo-body'>Body</label>
            <input id='todo-body' type='text'></input>
          </div>
          <div className='button-group'>
            <button type='submit'>Submit</button>
          </div>
        </form>
      </div>
    )
  }
}

export default TodoForm;