import ReactDOM from 'react-dom';
import React from 'react';
import * as Util from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './root';

document.addEventListener('DOMContentLoaded', () => {
  let store = configureStore();
  const root = document.getElementById('root');

  //window.getState = store.getState;
  //window.dispatch = store.dispatch;

  ReactDOM.render(<Root store={store}/>, root);
});
