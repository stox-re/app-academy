import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON, RECEIVE_NEW_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      let newState = Object.assign({}, state);
      Object.keys(action.pokemon).forEach((newPokemonKey) => {
        if (typeof newState[newPokemonKey] == 'undefined') {
          newState[newPokemonKey] = action.pokemon[newPokemonKey];
        }
      })
      return newState;

    case RECEIVE_ONE_POKEMON:
      let newObj = Object.assign({}, state);
      newObj[action.pokemon.pokemon.id] = action.pokemon.pokemon;
      return newObj;

    case RECEIVE_NEW_POKEMON:
        let newStateObj = Object.assign({}, state);
      newStateObj[action.pokemon.pokemon.id] = action.pokemon.pokemon;
      return newStateObj;

    default:
      return state;
  }
};

export default pokemonReducer;

