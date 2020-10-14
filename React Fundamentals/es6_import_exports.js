// todo_actions.js

const receiveTodo = todo => ({
  type: "RECEIVE_TODO",
  todo
});

const fetchTodos = () => ({
  type: "FETCH_TODOS"
});

const createTodo = todo => ({
  type: "CREATE_TODO",
  todo
});

export { receiveTodo, fetchTodos, createTodo };

// Or we can do this:

// todo_actions.js

export const receiveTodo = todo => ({
  type: "RECEIVE_TODO",
  todo
});

export const fetchTodos = () => ({
  type: "FETCH_TODOS"
});

export const createTodo = todo => ({
  type: "CREATE_TODO",
  todo
});

// todo_list.js
class TodoList {
  // class definition
}

export default TodoList;

// app.js
export default () => {
  // function body
};

import TodoList from './todo_list';
import App from './app';
import { createTodo, receiveTodo } from './todo_actions'; //multiple items

import * as TodoActions from './todo_actions';
// TodoActions now acts as a wrapper object for all the methods
// defined in 'todo_actions.js'
//let todo = ...;
TodoActions.createTodo(todo);
