export const RECEIVE_STEPS = 'RECEIVE_STEPS';
export const RECEIVE_STEP = 'RECEIVE_STEP';
export const REMOVE_STEP = 'REMOVE_STEP';

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