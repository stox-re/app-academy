import { connect } from 'react-redux';
import { receiveStep, removeStep, updateStep, deleteStep } from '../../actions/step_actions';
import { createStep } from '../../util';
import StepListItem from './step_list_item';

const mapDispatchToProps = (dispatch) => {
  return {
    receiveStep: (step) => { return dispatch(receiveStep(step)); },
    removeStep: (stepId) => { return dispatch(removeStep(stepId)); },
    updateStep: (step) => { return dispatch(updateStep(step)) },
    deleteStep: (step) => { return dispatch(deleteStep(step)); }
  };
}

export default connect(null, mapDispatchToProps)(StepListItem);