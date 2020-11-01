import { connect } from 'react-redux';
import { selectAllPokemon, selectLoading } from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';
import { requestAllPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
  loading: selectLoading(state)
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => { return dispatch(requestAllPokemon()); },
});

export default connect(mapStateToProps,mapDispatchToProps)(PokemonIndex);