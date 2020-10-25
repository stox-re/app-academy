export const RECEIVE_STEPS = 'RECEIVE_STEPS';
export const RECEIVE_STEP = 'RECEIVE_STEP';
export const REMOVE_STEP = 'REMOVE_STEP';
import * as Util from '../util';
import { receiveErrors } from './error_actions';

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

export const deleteStep = (step) => {
  return (dispatch) => {
    Util.deleteStep(step).then(
      (res) => {
        return dispatch(removeStep(res.id));
      },
      (err) => {
        return dispatch(receiveErrors(err.responseJSON))
      }
    );
  };
};

export const createStep = (step) => {
  return (dispatch) => {
    Util.createStep(step).then(
      (res) => {
        return dispatch(receiveStep(res));
      },
      (err) => {
        return dispatch(receiveErrors(err.responseJSON))
      }
    );
  };
};
