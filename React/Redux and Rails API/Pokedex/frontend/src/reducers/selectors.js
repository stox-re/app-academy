export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
};

export const selectOnePokemon = (state, pokemonId) => {
  return state.entities.pokemon[pokemonId];
};

export const selectItems = (state) => {
  return state.entities.items;
};