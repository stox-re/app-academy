import * as Util from '../util/api_util';
export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";

export const receiveAllPokemon = (pokemon) => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon: pokemon
  }
};

export const requestAllPokemon = () => {
  return (dispatch) => {
    return Util.fetchAllPokemon().then((pokemon) => {
      dispatch(receiveAllPokemon(pokemon));
    });
  };
};