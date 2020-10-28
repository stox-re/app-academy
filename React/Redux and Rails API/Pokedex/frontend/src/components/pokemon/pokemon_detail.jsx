import React from 'react';
import pokemonReducer from '../../reducers/pokemon_reducer';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    console.log("Mounting pokemon details with: " + this.props.match.params.pokemonId);
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
        <div>Attack: {this.props.pokemon.attack}</div>
        <div>Defence: {this.props.pokemon.defense}</div>
        <div>Type: {this.props.pokemon.poke_type}</div>
        <div>
        <ul>
          {this.props.pokemon.moves.map((move, idx) => { return <li key={idx}>{move}</li> })}
        </ul>
        </div>
      </div>
    }

    return (
      <div>
        {rendering}
      </div>
    )
  }
}

export default PokemonDetail;