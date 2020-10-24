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

  handleDoneClick(event) {
    let todo = this.props.todo;
    this.props.updateTodo({
      todo: {
        id: todo.id,
        done: !todo.done
      }
    });

    /*this.props.receiveTodo({
      id: todo.id,
      title: todo.title,
      body: todo.body,
      done: !todo.done
    });*/

    this.handleDotDone(event.currentTarget.children[0]);
  }

  handleDotDone(target) {
    if (!this.props.todo.done) {
      target.classList.add('dot-done');
    } else {
      target.classList.remove('dot-done');
    }
  }

  render() {
    let renderingTodoDetailView = this.state.detail ? <TodoDetailViewContainer todo={this.props.todo} /> : '';
    return (
      <li className='todo-list-item'>
        <div className='todo-item'>
          <div onClick={this.handleDoneClick.bind(this)} className='todo-item-titles'>
            <div className={this.props.todo.done ? 'dot check-dot dot-done' : 'dot check-dot'}></div>
            <div className='todo-item-open-details' >{this.props.todo.title} </div>
          </div>
          <div className='flex-item'>
            <div className='dot' onClick={this.handleViewDetailClick}>⋱</div>
            <div className='dot' onClick={this.handleRemoveClick}>✗</div>
          </div>
        </div>
        {renderingTodoDetailView}
      </li>
    );
  }
};

export default TodoListItem;