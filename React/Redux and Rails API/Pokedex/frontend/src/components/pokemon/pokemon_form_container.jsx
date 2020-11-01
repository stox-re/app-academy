import { connect } from 'react-redux';
import { createOnePokemon } from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form';

const mapStateToProps = undefined;

const mapDispatchToProps = dispatch => ({
  createOnePokemon: (pokemonData) => { return dispatch(createOnePokemon(pokemonData)); },
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonForm);