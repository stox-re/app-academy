import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import { Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';
import PokedexIntroView from './pokedex_intro_view';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    let lis = this.props.pokemon.map((poke, idx) => {
      return <PokemonIndexItem key={idx} pokemon={poke}/>
    });

    let loading = '';
    if (this.props.loading) {
      loading =
        <div id="loading-pokeball-container">
          <div id="loading-pokeball"></div>
        </div>;
    }

    return (
      <div className="pokedex">
        {loading}
        <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer} />
        <Route exact path='/' component={PokedexIntroView} />
        <ul className="pokedex-list">
          {lis}
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;