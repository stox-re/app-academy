import ReactDOM from 'react-dom';
import React from 'react';
import { addApple, addOrange, clearFruit } from './actions';
import FruitStandContainer from './components/fruit_stand_container';
import { Provider } from 'react-redux';
import store from './store';
// Provider makes the state available everywhere to sub-components

window.store = store;
window.addApple = addApple;
window.addOrange = addOrange;
window.clearFruit = clearFruit;

const App = () => {
  return (
    <Provider store={store}>
      <FruitStandContainer />
    </Provider>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<App />, root);
});
