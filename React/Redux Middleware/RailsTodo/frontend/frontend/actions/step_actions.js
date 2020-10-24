export const RECEIVE_STEPS = 'RECEIVE_STEPS';
export const RECEIVE_STEP = 'RECEIVE_STEP';
export const REMOVE_STEP = 'REMOVE_STEP';
import * as Util from '../util';

export const receiveSteps = (steps) => {
  return {
    type: RECEIVE_STEPS,
    steps: steps
  };
};

export const receiveStep = (step) => {
  return {
    type: RECEIVE_STEP,
    step: step
  };
};

export const removeStep = (stepId) => {
  return {
    type: REMOVE_STEP,
    id: stepId
  }
}

export const fetchSteps = (todoId) => {
  return (dispatch) => {
    Util.fetchSteps(todoId).then((res) => {
      return dispatch(receiveSteps(res));
    });
  };
};

export const updateStep = (step) => {
  return (dispatch) => {
    Util.updateStep(step).then((res) => {
      return dispatch(receiveStep(res));
    });
  };
};