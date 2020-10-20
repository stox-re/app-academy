import { connect } from 'react-redux';
import { receiveStep } from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';
import StepList from './step_list';

const mapStateToProps = (state, props) => {
  console.log("Map state props");
  console.log(props.todo.id);
  return {
    steps: stepsByTodoId(state, props.todo.id),
    todo_id: props.todo.id
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveStep: (step) => { return dispatch(receiveStep(step)); }
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(StepList);