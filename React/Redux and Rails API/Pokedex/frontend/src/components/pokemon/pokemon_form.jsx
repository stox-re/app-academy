import React from 'react';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      pokemon: {
        name: '',
        attack: '',
        defense: '',
        poke_type: '',
        moves: [],
        image_url: ''
      }
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.createOnePokemon(this.state);
  }

  handleChange(e) {
    this.setState(prevState => ({
      pokemon: {
        ...prevState.pokemon,
        [e.target.id]: e.target.value
      }
    }));
  }
  //params.require(:pokemon).permit(:name, :attack, :defence, :poke_type, :moves, :image_url)
  render() {
    let types = [
      'fire',
      'electric',
      'normal',
      'ghost',
      'psychic',
      'water',
      'bug',
      'dragon',
      'grass',
      'fighting',
      'ice',
      'flying',
      'poison',
      'ground',
      'rock',
      'steel'
    ];
    let typeOptions = [];
    types.forEach((type, index) => {
      typeOptions.push(<option key={index} value={type}>{type}</option>)
    })

    return (
      <div className="pokemon-form">
        <h1>Add a New Pokemon</h1>
        <form>
          <div className='input-group'>
            <label htmlFor='name'>Name</label>
            <input onChange={this.handleChange} id='name' type='text' value={this.state.pokemon.name}></input>
          </div>
          <div className='input-group'>
            <label htmlFor='attack'>Attack</label>
            <input onChange={this.handleChange} id='attack' type='text' value={this.state.pokemon.attack}></input>
          </div>
          <div className='input-group'>
            <label htmlFor='defense'>Defense</label>
            <input onChange={this.handleChange} id='defense' type='text' value={this.state.pokemon.defense}></input>
          </div>
          <div className='input-group'>
            <label htmlFor='poke_type'>Pokemon Type</label>
            <select id='poke_type' value={this.state.pokemon.poke_type} onChange={this.handleChange}>
              {typeOptions}
            </select>
          </div>
          <div className='input-group'>
            <label htmlFor='image_url'>Image Url</label>
            <input onChange={this.handleChange} id='image_url' type='text' value={this.state.pokemon.image_url}></input>
          </div>
          <div className='button-group'>
            <button onClick={this.handleSubmit} type='submit'>Submit</button>
          </div>
        </form>
      </div>
    );
  }
}

export default PokemonForm;