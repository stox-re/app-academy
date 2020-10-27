import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    console.log("This props")
    console.log(this.props.pokemon);
    let lis = this.props.pokemon.map((poke, idx) => {
      return <li className="pokemon-list-item" key={idx}><img src={poke.image_url}></img>{poke.name}</li>
    });

    return (
      <div>
        <ul>
          {lis}
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;