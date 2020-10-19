import React from 'react';

const TodoDetailView = (props) => {
  return (
    <div className='todo-detail-view'>
      <div>{props.todo.body}</div>
    </div>
  )
};

export default TodoDetailView;