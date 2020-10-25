import { connect } from 'react-redux';
import { receiveStep, fetchSteps, createStep } from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';
import StepList from './step_list';

const mapStateToProps = (state, props) => {
  return {
    steps: stepsByTodoId(state, props.todo.id),
    todo_id: props.todo.id
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveStep: (step) => { return dispatch(receiveStep(step)); },
    fetchSteps: (todoId) => { return dispatch(fetchSteps(todoId)); },
    createStep: (step) => { return dispatch(createStep(step)); }
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(StepList);