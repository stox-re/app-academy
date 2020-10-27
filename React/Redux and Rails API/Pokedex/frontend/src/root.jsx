import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './components/pokemon/pokemon_index_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <div>
      <PokemonIndexContainer />
    </div>
  </Provider>
);

export default Root;