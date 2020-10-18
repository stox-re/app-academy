import { ADD_FRUIT, CLEAR_FRUIT } from './actions';

const _defaultState = {
  fruits: []
};

const reducer = (oldState = _defaultState, action) => {
  switch(action.type) {
    case ADD_FRUIT:
      return {
        fruits: [ ...oldState.fruits, action.fruit ]
      };
    case CLEAR_FRUIT:
      return _defaultState;
    default:
      return oldState;
  }
};

export default reducer;
