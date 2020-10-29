import React from 'react';
import { Route, NavLink } from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestOnePokemon(this.props.match.params.pokemonId);
  }

  componentDidUpdate(prevProps) {
    if (this.props.match.params.pokemonId != prevProps.match.params.pokemonId) {
      this.props.requestOnePokemon(this.props.match.params.pokemonId);
    }
  }

  render() {
    let rendering = '';
    if (typeof this.props.pokemon != 'undefined' && typeof this.props.pokemon.attack != 'undefined') {
      rendering =
        <div className="pokemon-detail">
          <div className="name-image">
            <h2>{this.props.pokemon.name}</h2>
            <img src={this.props.pokemon.image_url}></img>
          </div>
          <div className="pokemon-attributes">
            <h3>Attack: {this.props.pokemon.attack}</h3>
            <h3>Defence: {this.props.pokemon.defense}</h3>
            <h3>Type: {this.props.pokemon.poke_type}</h3>
            <div className="pokemon-links">
              {
                this.props.thisPokemonItems.map((item, idx) => {
                  return <NavLink className="item-link" key={idx} to={`/pokemon/${this.props.pokemon.id}/items/${item.id}`}>{item.name}</NavLink>
                })
              }
            </div>
          </div>
          <Route path={`/pokemon/:pokemonId/items/:itemId`} component={ItemDetailContainer} />
        </div>
    }

    let loading = '';
    if (this.props.loading) {
      loading =
        <div id="loading-pokeball-container">
          <div id="loading-pokeball"></div>
        </div>;
    }

    return (
      <div className="pokemon-detail-container">
        {loading}
        {rendering}
      </div>
    )
  }
}

export default PokemonDetail;