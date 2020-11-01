import pokemonReducer from '../reducers/pokemon_reducer';
import * as Util from '../util/api_util';
export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";
export const RECEIVE_NEW_POKEMON = "RECEIVE_NEW_POKEMON";
export const RECEIVE_ITEMS_FROM_POKEMON = "RECEIVE_ITEMS_FROM_POKEMON";
export const START_LOADING_ALL_POKEMON = "START_LOADING_ALL_POKEMON";
export const START_LOADING_SINGLE_POKEMON = "START_LOADING_SINGLE_POKEMON";
export const STOP_LOADING_POKEMON = "STOP_LOADING_POKEMON";

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

export const receiveNewPokemon = (pokemon) => {
  return {
    type: RECEIVE_NEW_POKEMON,
    pokemon: pokemon
  }
};

export const receiveItemsFromPokemon = (pokemon) => {
  return {
    type: RECEIVE_ITEMS_FROM_POKEMON,
    pokemon: pokemon
  }
}

export const startLoadingAllPokemon = () => {
  return {
    type: START_LOADING_ALL_POKEMON,
    value: true
  }
};

export const startLoadingSinglePokemon = () => {
  return {
    type: START_LOADING_SINGLE_POKEMON,
    value: true
  }
};
export const stopLoadingPokemon = () => {
  return {
    type: STOP_LOADING_POKEMON,
    value: false
  }
};

export const requestAllPokemon = () => {
  return (dispatch) => {
    dispatch(startLoadingAllPokemon());

    return Util.fetchAllPokemon().then((pokemon) => {
      dispatch(receiveAllPokemon(pokemon));
      dispatch(stopLoadingPokemon());
    });
  };
};

export const requestOnePokemon = (pokemonId) => {
  return (dispatch) => {
    dispatch(startLoadingSinglePokemon());

    return Util.fetchOnePokemon(pokemonId).then((pokemon) => {
      dispatch(receiveOnePokemon(pokemon));
      dispatch(receiveItemsFromPokemon(pokemon));
      dispatch(stopLoadingPokemon());
      return pokemon;
    })
  };
};

export const createOnePokemon = (pokemonData) => {
  return (dispatch) => {
    dispatch(startLoadingAllPokemon);

    return Util.createPokemon(pokemonData).then((pokemon) => {
        dispatch(receiveOnePokemon(pokemon));
        dispatch(stopLoadingPokemon());
        return pokemon;
    });
  };
};