import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestOnePokemon } from '../../actions/pokemon_actions';
import { selectItems, selectOnePokemon, selectThisPokemonItems, selectLoading } from '../../reducers/selectors.js';

const mapStateToProps = (state, selfProps) => ({
  pokemon: selectOnePokemon(state, selfProps.match.params.pokemonId),
  items: selectItems(state),
  thisPokemonItems: selectThisPokemonItems(state, selfProps.match.params.pokemonId),
  loading: selectLoading(state)
});

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: (pokemonId) => { return dispatch(requestOnePokemon(pokemonId)); },
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);