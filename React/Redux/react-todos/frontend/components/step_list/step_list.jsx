import React from 'react';
import StepListItemContainer from './step_list_item_container';

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
    </div>
  )
};

export default StepList;