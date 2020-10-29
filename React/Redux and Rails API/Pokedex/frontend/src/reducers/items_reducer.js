import { RECEIVE_ITEMS_FROM_POKEMON } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ITEMS_FROM_POKEMON:
      let newState = Object.assign({}, state);
      action.pokemon.items.forEach((item, idx) => {
        let innerObj = Object.keys(item);
        innerObj.forEach((key) => {
          newState[key] = item[key];
        });
      });
      return newState;
    default:
      return state;
  }
};

export default itemsReducer;