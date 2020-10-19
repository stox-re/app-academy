import ReactDOM from 'react-dom';
import React from 'react';
import configureStore from './store/store.js';
import { receiveTodos, receiveTodo } from './actions/todo_actions';

const App = () => {
  return (
    <div>
      React is working
    </div>
  )
}

const store = configureStore();
window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<App />, root);
});
