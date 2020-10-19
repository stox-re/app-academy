import ReactDOM from 'react-dom';
import React from 'react';
import configureStore from './store/store.js';
import Root from './components/root';

import { receiveTodos, receiveTodo } from './actions/todo_actions';
import { allTodos } from './reducers/selectors';

const store = configureStore();
window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.allTodos = allTodos;

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
