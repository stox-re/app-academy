import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
  }

  handleRemoveClick() {
    this.props.removeTodo(this.props.todo.id);
  }

  handleDoneClick() {
    let todo = this.props.todo;
    this.props.receiveTodo({
      id: todo.id,
      title: todo.title,
      body: todo.body,
      done: !todo.done
    })
  }

  render() {
    return (
      <li className='todo-item'>
        <div>{this.props.todo.title} </div>
        <div>
          {this.props.todo.done ? '✔' : ''}
          <button onClick={this.handleDoneClick.bind(this)}>{this.props.todo.done ? 'Undo' : 'Done'}</button>
          <button className='remove' onClick={this.handleRemoveClick.bind(this)}>X</button>
        </div>
      </li>
    );
  }
};

export default TodoListItem;