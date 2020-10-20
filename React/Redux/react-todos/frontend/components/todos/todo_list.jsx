import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const TodoList = (props) => {
  return (
    <div>
      <ul className='todo-list'>
        {
          props.todos.map((todo, index) => {
            return <TodoListItem removeTodo={props.removeTodo} receiveTodo={props.receiveTodo} key={index} todo={todo} />
          })
        }
      </ul>
      {<TodoForm receiveTodo={props.receiveTodo} />}
    </div>
  )
};

export default TodoList;