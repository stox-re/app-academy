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

  handleDone(event) {
    console.log("Handle done");
    let step = this.props.step;
    console.log(step);
    this.props.receiveStep({
      id: step.id,
      todo_id: step.todo_id,
      title: step.title,
      done: !step.done
    });
    this.handleDotDone(event.currentTarget.children[0])
  }

  handleRemove() {
    let stepId = this.props.step.id;
    this.props.removeStep(stepId)
  }
  handleDotDone(target) {
    if (!this.props.step.done) {
      target.classList.add('dot-done');
    } else {
      target.classList.remove('dot-done');
    }
  }
  render() {
    return (
      <li className='step-list-item'>
        <div onClick={this.handleDone}>
          <div className='step-list-item step-list-done'>
            <div className={this.props.step.done ? 'dot check-dot dot-done' : 'dot check-dot'}></div>
            {this.props.step.title}
          </div>
        </div>
        <div>
          <div onClick={this.handleRemove} className='dot'>✗</div>
        </div>
      </li>
    )
  }

}

export default StepListItem;