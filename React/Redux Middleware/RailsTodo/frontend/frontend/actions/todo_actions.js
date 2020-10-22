export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';
import * as Util from '../util';

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
    Util.createTodo(todo).then((res) => {
      return dispatch(receiveTodo(res));
    });
  };
}