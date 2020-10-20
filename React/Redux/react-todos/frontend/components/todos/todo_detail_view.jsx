import React from 'react';
import StepListContainer from '../step_list/step_list_container';

const TodoDetailView = (props) => {
  return (
    <div className='todo-detail-view'>
      <StepListContainer todo={props.todo} />
    </div>
  )
};

export default TodoDetailView;