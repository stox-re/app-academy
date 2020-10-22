import ReactDOM from 'react-dom';
import React from 'react';
import configureStore from './store/store.js';
import Root from './components/root';

import { receiveTodos, receiveTodo, fetchTodos } from './actions/todo_actions';
import { receiveSteps, receiveStep, removeStep } from './actions/step_actions';

import { allTodos, stepsByTodoId } from './reducers/selectors';
import * as Util from './util';
let store = configureStore();
window.Util = Util;
window.store = store;
window.fetchTodos = fetchTodos;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.receiveSteps = receiveSteps;
window.receiveStep = receiveStep;
window.removeStep = removeStep;
window.allTodos = allTodos;
window.stepsByTodoId = stepsByTodoId;

/* const applyMiddlewares = (inputStore, middlewareList) => {
  let dispatch = inputStore.dispatch;
  middlewareList.forEach((middleware) => {
    dispatch = middleware(inputStore)(dispatch);
  });

  return Object.assign({}, inputStore, { dispatch });
}; */

document.addEventListener('DOMContentLoaded', () => {
  //store = applyMiddlewares(store, [addLoggingToDispatch]);

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
