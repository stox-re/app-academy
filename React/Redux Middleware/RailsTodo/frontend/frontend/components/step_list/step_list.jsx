import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

class StepList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    console.log("This props todo_id: " + this.props.todo_id);
    this.props.fetchSteps(this.props.todo_id);
  }

  render () {
    let listItems = [];
    this.props.steps.forEach((step, index) => {
      listItems.push(<StepListItemContainer key={step.id} index={index + 1} step={step} />)
    });

    return (
      <div className='step-list-view'>
        <ul>
          {listItems}
        </ul>
        <StepForm
          todoId={this.props.todo_id}
          receiveStep={this.props.receiveStep}
          createStep={this.props.createStep}
          />
      </div>
    )
  };
};

export default StepList;