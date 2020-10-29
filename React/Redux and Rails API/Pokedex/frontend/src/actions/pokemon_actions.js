import pokemonReducer from '../reducers/pokemon_reducer';
import * as Util from '../util/api_util';
export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";
export const RECEIVE_ITEMS_FROM_POKEMON = "RECEIVE_ITEMS_FROM_POKEMON";

export const receiveAllPokemon = (pokemon) => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon: pokemon
  }
};

export const receiveOnePokemon = (pokemon) => {
  return {
    type: RECEIVE_ONE_POKEMON,
    pokemon: pokemon
  }
};

export const receiveItemsFromPokemon = (pokemon) => {
  return {
    type: RECEIVE_ITEMS_FROM_POKEMON,
    pokemon: pokemon
  }
}

export const requestAllPokemon = () => {
  return (dispatch) => {
    return Util.fetchAllPokemon().then((pokemon) => {
      dispatch(receiveAllPokemon(pokemon));
    });
  };
};

export const requestOnePokemon = (pokemonId) => {
  return (dispatch) => {
    return Util.fetchOnePokemon(pokemonId).then((pokemon) => {
      dispatch(receiveOnePokemon(pokemon));
      dispatch(receiveItemsFromPokemon(pokemon));
      return pokemon;
    })
  };
};