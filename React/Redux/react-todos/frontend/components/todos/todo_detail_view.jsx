import React from 'react';
import StepListContainer from '../step_list/step_list_container';

const TodoDetailView = (props) => {
  return (
    <div className='todo-detail-view'>
      <div>{props.todo.body}</div>
      <StepListContainer todoId={props.todo.id} />
    </div>
  )
};

export default TodoDetailView;