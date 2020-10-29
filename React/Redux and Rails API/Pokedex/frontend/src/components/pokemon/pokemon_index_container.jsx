import { connect } from 'react-redux';
import { selectAllPokemon, selectLoading } from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
  loading: selectLoading(state)
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => { return dispatch(requestAllPokemon()); },
});

export default connect(mapStateToProps,mapDispatchToProps)(PokemonIndex);