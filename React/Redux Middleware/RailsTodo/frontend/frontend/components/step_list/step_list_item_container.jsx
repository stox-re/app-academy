import { connect } from 'react-redux';
import { receiveStep, removeStep, updateStep } from '../../actions/step_actions';
import StepListItem from './step_list_item';

const mapDispatchToProps = (dispatch) => {
  return {
    receiveStep: (step) => { return dispatch(receiveStep(step)); },
    removeStep: (stepId) => { return dispatch(removeStep(stepId)); },
    updateStep: (step) => { return dispatch(updateStep(step)) }
  };
}

export default connect(null, mapDispatchToProps)(StepListItem);