import React from 'react';
import StepListContainer from '../step_list/step_list_container';

const TodoDetailView = (props) => {
  return (
    <div className='todo-detail-view'>
      <div className='todo-detail-body'>{props.todo.body}</div>
      <StepListContainer todo={props.todo} />
    </div>
  )
};

export default TodoDetailView;