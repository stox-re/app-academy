import { RECEIVE_ITEMS_FROM_POKEMON } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ITEMS_FROM_POKEMON:
      const newState = Object.assign({}, state, action.pokemon.items);

      return newState;
    default:
      return state;
  }
};

export default itemsReducer;