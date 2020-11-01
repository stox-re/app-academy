import React from 'react';
import PokedexIntroView from './pokedex_intro_view';
import PokemonFormContainer from './pokemon_form_container';
import { Route } from 'react-router-dom';

const PokemonRootView = () => {
  return (
    <div className="pokedex-root-view">
      <Route exact path='/' component={PokedexIntroView} />
      <Route exact path='/' component={PokemonFormContainer} />
    </div>
  );
};

export default PokemonRootView;