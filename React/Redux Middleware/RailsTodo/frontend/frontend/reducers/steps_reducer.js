import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from '../actions/step_actions';

const initialState = {
  1: {
    id:1,
    todo_id: 1,
    title: "get soap",
    done: false
  },
  2: {
    id:2,
    todo_id: 1,
    title: "get water",
    done: false
  },
  3: {
    id:3,
    todo_id: 1,
    title: "now wash",
    done: false
  },
  4: {
    id:4,
    todo_id: 2,
    title: "get water and shampoo",
    done: true
  },
  5: {
    id:5,
    todo_id: 2,
    title: "wash the dog now",
    done: true
  }
};

const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_STEPS:
      return Object.assign({}, action.steps);

    case RECEIVE_STEP:
      let receiveNewState = Object.assign({}, state);
      receiveNewState[action.step.id] = action.step;
      return receiveNewState;

    case REMOVE_STEP:
      let newStateRemoved = Object.assign({}, state);
      delete newStateRemoved[action.id];
      return newStateRemoved;

    default:
      return state;
  }
};

export default stepsReducer;

