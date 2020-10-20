import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

const StepList = (props) => {

  let listItems = [];
  props.steps.forEach((step, index) => {
    listItems.push(<StepListItemContainer key={step.id} index={index + 1} step={step} />)
  });

  return (
    <div className='step-list-view'>
      <h4>Steps:</h4>
      <ul>
        {listItems}
      </ul>
      <StepForm todoId={props.steps[0].todo_id} receiveStep={props.receiveStep} />
    </div>
  )
};

export default StepList;