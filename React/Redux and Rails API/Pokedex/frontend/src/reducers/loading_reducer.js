import { START_LOADING_ALL_POKEMON, START_LOADING_SINGLE_POKEMON, STOP_LOADING_POKEMON} from '../actions/pokemon_actions';

const itemsReducer = (state = { value: false }, action) => {
  switch (action.type) {
    case START_LOADING_ALL_POKEMON:
      return {
        value: action.value
      };
    case START_LOADING_SINGLE_POKEMON:
      return {
        value: action.value
      };
    case STOP_LOADING_POKEMON:
      return {
        value: action.value
      };
    default:
      return state;
  }
};

export default itemsReducer;