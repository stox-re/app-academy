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
    this.props.createOnePokemon(this.state).then((resData) => {
      if (resData.success) {
        this.props.history.push(`pokemon/${resData.pokemon.id}`);
      }
    });
  }

  handleChange(e) {
    this.setState(prevState => ({
      pokemon: {
        ...prevState.pokemon,
        [e.target.id]: e.target.value
      }
    }));
  }

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

    let errors = [];
    if (Object.keys(this.props.errors).length != 0) {
      this.props.errors.errors.forEach((err, index) => {
        errors.push(<li key={index}>{err}</li>)
      });
    }

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
              <option defaultValue=''>Select a type</option>
              {typeOptions}
            </select>
          </div>
          <div className='input-group'>
            <label htmlFor='image_url'>Image (1-152.svg)</label>
            <input onChange={this.handleChange} id='image_url' type='text' value={this.state.pokemon.image_url}></input>
          </div>
          <div className='button-group'>
            <button onClick={this.handleSubmit} type='submit'>Submit</button>
          </div>
        </form>
        <ul className="errors">
          {errors}
        </ul>
      </div>
    );
  }
}

export default PokemonForm;