import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from '../actions/step_actions';

const initialState = {};

const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_STEPS:
      return Object.assign({}, action.steps);

    case RECEIVE_STEP:
      let receiveNewState = Object.assign({}, state);
      Object.keys(receiveNewState).forEach((key) => {
        if (receiveNewState[key].id == action.step[0].id) {
          receiveNewState[key] = action.step[0];
        }
      })
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

