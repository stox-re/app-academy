import React from 'react';

const TodoListItem = (props) => {
  return (
    <li className='todo-item'>{props.todo.title} <span className='todo-number'>{props.todo.id}</span></li>
  );
};

export default TodoListItem;