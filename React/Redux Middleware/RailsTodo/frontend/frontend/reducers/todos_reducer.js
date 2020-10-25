import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';

const initialState = {};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_TODOS:
      let newObjectToSwitchKeys = Object.assign({}, action.todos);
      return newObjectToSwitchKeys;

    case RECEIVE_TODO:
      let receiveNewState = Object.assign({}, state);
      let wasFound = false;
      Object.keys(receiveNewState).forEach((key) => {
        if (receiveNewState[key].id == action.todo.id) {
          wasFound = true;
          receiveNewState[key] = action.todo;
        }
      });
      if (!wasFound) {
        receiveNewState[action.todo.id] = action.todo;
      }
      return receiveNewState;

    case REMOVE_TODO:
      let newStateRemoved = Object.assign({}, state);
      Object.keys(newStateRemoved).forEach((key) => {
        if (newStateRemoved[key].id == action.id) {
          delete newStateRemoved[key];
        }
      });
      return newStateRemoved;

    default:
      return state;
  }
};

export default todosReducer;

