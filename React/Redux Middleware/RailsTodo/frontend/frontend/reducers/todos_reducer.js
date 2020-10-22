import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';

/*const initialState = {
  1: {
    id: 1,
    title: "Wash the car",
    body: "using soap and water",
    done: false
  },
  2: {
    id: 2,
    title: "Wash the dog",
    body: "once you get a dog, with shampoo",
    done: true
  }
};*/
const initialState = {};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_TODOS:
      return Object.assign({}, action.todos);

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

