import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    return (
      <div>
        <ul className='todo-list'>
          {
            this.props.todos.map((todo, index) => {
              return <TodoListItem
                removeTodo={this.props.removeTodo}
                receiveTodo={this.props.receiveTodo}
                updateTodo={this.props.updateTodo}
                key={index}
                todo={todo} />
            })
          }
        </ul>
        {<TodoForm
          receiveTodo={this.props.receiveTodo}
          createTodo={this.props.createTodo}
          errors={this.props.errors}
          clearErrors={this.props.clearErrors}
        />}
      </div>
    );
  }
};

export default TodoList;