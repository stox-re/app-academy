export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';
import * as Util from '../util';
import { receiveErrors } from './error_actions';

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos: todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo: todo
  };
};

export const removeTodo = (todoId) => {
  return {
    type: REMOVE_TODO,
    id: todoId
  }
};

export const fetchTodos = () => {
  return (dispatch) => {
    Util.fetchTodos().then((res) => {
      return dispatch(receiveTodos(res));
    });
  };
};

export const createTodo = (todo) => {
  return (dispatch) => {
    return Util.createTodo(todo).then(
      (res) => {
        dispatch(receiveTodo(res));
      },
      (err)  => {
        dispatch(receiveErrors(err.responseJSON))
      }
    );
  };
};

export const updateTodo = (todo) => {
  return (dispatch) => {
    Util.updateTodo(todo).then(
      (res) => {
        return dispatch(receiveTodo(res));
      },
      (err) => {
        return dispatch(receiveErrors(err.responseJSON))
      }
    );
  };
};

export const deleteTodo = (todo) => {
  return (dispatch) => {
    Util.deleteTodo(todo).then(
      (res) => {
        return dispatch(removeTodo(res.id));
      },
      (err) => {
        return dispatch(receiveErrors(err.responseJSON))
      }
    );
  };
};

