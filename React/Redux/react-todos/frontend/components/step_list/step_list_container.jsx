import { connect } from 'react-redux';
import { receiveStep } from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';
import StepList from './step_list';

const mapStateToProps = (state, { todoId }) => {
  return {
    steps: stepsByTodoId(state, todoId),
    todo_id: todoId
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveStep: (step) => { return dispatch(receiveStep(step)); }
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(StepList);