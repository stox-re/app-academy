import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      detail: false
    }

    this.handleDoneClick = this.handleDoneClick.bind(this);
    this.handleRemoveClick = this.handleRemoveClick.bind(this);
    this.handleViewDetailClick = this.handleViewDetailClick.bind(this);
  }

  handleViewDetailClick() {
    this.setState({
      detail: !this.state.detail
    });
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
    let renderingTodoDetailView = this.state.detail ? <TodoDetailViewContainer todo={this.props.todo} /> : '';
    return (
      <li>
        <div className='todo-item'>
          <div className='todo-item-open-details' onClick={this.handleViewDetailClick}>{this.props.todo.title} </div>
          <div>
            {this.props.todo.done ? '✔' : ''}
            <button onClick={this.handleDoneClick.bind(this)}>{this.props.todo.done ? 'Undo' : 'Done'}</button>
            <button className='remove' onClick={this.handleRemoveClick.bind(this)}>X</button>
          </div>
        </div>
        {renderingTodoDetailView}
      </li>
    );
  }
};

export default TodoListItem;