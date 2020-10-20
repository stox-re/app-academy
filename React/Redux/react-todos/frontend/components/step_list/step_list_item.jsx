import React from 'react';

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      done: false
    }
    console.log("Step list item props");
    console.log(props);

    this.handleDone = this.handleDone.bind(this);
    this.handleRemove = this.handleRemove.bind(this);
  }

  handleDone() {
    console.log("Handle done");
    let step = this.props.step;
    console.log(step);
    this.props.receiveStep({
      id: step.id,
      todo_id: step.todo_id,
      title: step.title,
      done: !step.done
    });
  }

  handleRemove() {
    let stepId = this.props.step.id;
    this.props.removeStep(stepId)
  }

  render() {
    return (
      <li className='step-list-item'>
        <div>
          {this.props.index}. &nbsp;
          {this.props.step.title}
        </div>
        <div>
          {this.props.step.done ? '✔' : ''}
          <button onClick={this.handleDone}>{this.props.step.done ? 'Undo' : 'Done'}</button>
          <button onClick={this.handleRemove}>X</button>
        </div>
      </li>
    )
  }

}

export default StepListItem;