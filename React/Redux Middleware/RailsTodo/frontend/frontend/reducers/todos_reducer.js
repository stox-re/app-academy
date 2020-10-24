import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';

const initialState = {};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_TODOS:
      let newObject = {};
      let newObjectToSwitchKeys = Object.assign({}, action.todos);
      Object.keys(newObjectToSwitchKeys).forEach((key) => {
        newObject[newObjectToSwitchKeys[key].id] = newObjectToSwitchKeys[key];
      })
      return newObject;

    case RECEIVE_TODO:
      let receiveNewState = Object.assign({}, state);
      receiveNewState[action.todo.id] = action.todo;
      return receiveNewState;

    case REMOVE_TODO:
      let newStateRemoved = Object.assign({}, state);
      delete newStateRemoved[action.id];
      return newStateRemoved;

    default:
      return state;
  }
};

export default todosReducer;

